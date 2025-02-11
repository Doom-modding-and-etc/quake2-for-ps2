/*
Copyright (C) 1997-2001 Id Software, Inc.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

*/

// glimp_null.c -- null OpenGL context.

#include "src/client/client.h"

void GLimp_BeginFrame(float camera_separation)
{
}

void GLimp_EndFrame(void)
{
}

int GLimp_Init(void * hinstance, void * hWnd)
{
    return 0;
}

void GLimp_Shutdown(void)
{
}

int GLimp_SetMode(int * pwidth, int * pheight, int mode, qboolean fullscreen)
{
    return 0;
}

void GLimp_AppActivate(qboolean active)
{
}

void GLimp_EnableLogging(qboolean enable)
{
}

void GLimp_LogNewFrame(void)
{
}
