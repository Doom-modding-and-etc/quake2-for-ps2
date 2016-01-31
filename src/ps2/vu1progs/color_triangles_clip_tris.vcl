
;--------------------------------------------------------------------
; color_triangles_clip_tris.vcl
;
; A VU1 microprogram to draw a batch of colored triangles.
; - Vertex format: RGBAQ | XYZ2
; - Writes the output in-place.
; - Performs clipping (whole triangles).
;--------------------------------------------------------------------

#include "src/ps2/vu1progs/vu_utils.inc"

; Data offsets in the VU memory (quadword units):
#define MVP_MATRIX    0
#define SCALE_FACTORS 4
#define VERTEX_COUNT  4
#define GIF_TAG       5
#define START_COLOR   6
#define START_VERT    7

#vuprog VU1Prog_Color_Triangles

    ; Clear the clip flag so we can use the CLIP instruction:
    fcset 0

    ; Number of vertexes we need to process here:
    ; (W component of the quadword used by the scale factors)
    ilw.w iNumVerts, VERTEX_COUNT(vi00)

    ; Loop counter / vertex ptr:
    iaddiu iVert,    vi00, 0 ; Start vertex counter
    iaddiu iVertPtr, vi00, 0 ; Point to the first vertex (0=color-qword, 1=position-qword)

    ; Load rasterizer scaling factors:
    lq fScales, SCALE_FACTORS(vi00)

    ; Model View Projection matrix:
    MatrixLoad{ fMVPMatrix, MVP_MATRIX, vi00 }

    ; Loop for each triangle in the batch:
    lTrianglesLoop:
        ; Transform the 3 vertexes:
        DoVertex{ START_VERT+0, iVertPtr, fVert0, fScales, fMVPMatrix }
        DoVertex{ START_VERT+2, iVertPtr, fVert1, fScales, fMVPMatrix }
        DoVertex{ START_VERT+4, iVertPtr, fVert2, fScales, fMVPMatrix }

        ; Now we figure out if any of 3 vertexes were
        ; clipped and set a common ADC flag for all 3
        ; so that the whole triangle is discarded if
        ; one vertex was clipped.
        fcand  vi01, 0x3FFFF
        iaddiu iADC, vi01, 0x7FFF

        ; Store each vertex with proper ADC draw flag:
        sq.xyz fVert0, START_VERT+0(iVertPtr)
        isw.w  iADC,   START_VERT+0(iVertPtr)
        sq.xyz fVert1, START_VERT+2(iVertPtr)
        isw.w  iADC,   START_VERT+2(iVertPtr)
        sq.xyz fVert2, START_VERT+4(iVertPtr)
        isw.w  iADC,   START_VERT+4(iVertPtr)

        ; Increment by 6 quadwords (3 vert, 2 qwords a piece).
        iaddiu iVertPtr, iVertPtr, 6

        ; Increment the vertex counter and jump back to lTrianglesLoop if not done yet.
        iaddiu iVert, iVert, 3
        ibne   iVert, iNumVerts, lTrianglesLoop
    ; END lTrianglesLoop

    iaddiu iGIFTag, vi00, GIF_TAG ; Load the position of the GIF tag
    xgkick iGIFTag                ; and tell the VU to send that to the GS

#endvuprog
