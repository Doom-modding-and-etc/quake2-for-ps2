
#
# !!! NOTE: Header files are completely ignored !!!
# If you change a header file, either make clean or
# change the accompanying source files to force a rebuild!
#

EE_BIN = ps2quake2.elf

# ---------------------------------------------------------
#  Quake 2 source files:
# ---------------------------------------------------------

#
# All C source files used by the game and engine:
#
# src/ps2/vec_mat.o
EE_OBJS = src/ps2/fact3.o src/ps2/tests/test_draw2d.o src/ps2/tests/test_draw3d.o src/ps2/builtin/backtile.o \
src/ps2/builtin/conback.o src/ps2/builtin/conchars.o src/ps2/builtin/help.o src/ps2/builtin/inventory.o \
src/ps2/builtin/palette.o src/ps2/debug_print.o src/ps2/dma_mgr.o src/ps2/main_ps2.o src/ps2/math_funcs.o \
src/ps2/mem_alloc.o src/ps2/model_load.o src/ps2/net_ps2.o src/ps2/ref_ps2.o src/ps2/sys_ps2.o \
src/ps2/tex_image.o src/ps2/view_draw.o src/ps2/vid_ps2.o src/ps2/vu1.o \
src/ps2/vu_prog_mgr.o src/client/cl_cin.o src/client/cl_ents.o src/client/cl_fx.o src/client/cl_input.o \
src/client/cl_inv.o src/client/cl_main.o src/client/cl_newfx.o src/client/cl_parse.o src/client/cl_pred.o \
src/client/cl_scrn.o src/client/cl_tent.o src/client/cl_view.o src/client/console.o src/client/keys.o \
src/client/menu.o src/client/qmenu.o src/client/snd_dma.o src/client/snd_mem.o src/client/snd_mix.o \
src/common/cmd.o src/common/cmodel.o src/common/common.o src/common/crc.o src/common/cvar.o \
src/common/filesys.o src/common/md4.o src/common/net_chan.o src/common/pmove.o src/game/g_ai.o \
src/game/g_chase.o src/game/g_cmds.o src/game/g_combat.o src/game/g_func.o src/game/g_items.o \
src/game/g_main.o src/game/g_misc.o src/game/g_monster.o src/game/g_phys.o src/game/g_save.o \
src/game/g_utils.o src/game/g_weapon.o src/game/m_actor.o src/game/m_berserk.o src/game/m_boss2.o \
src/game/m_boss3.o src/game/m_boss31.o src/game/m_boss32.o src/game/m_brain.o src/game/m_chick.o \
src/game/m_move.o src/game/m_mutant.o src/game/m_parasite.o src/game/m_soldier.o src/game/m_supertank.o \
src/game/m_tank.o src/game/p_client.o src/game/p_hud.o src/game/p_trail.o src/game/p_view.o \
src/game/p_weapon.o src/game/q_shared.o src/null/cd_null.o src/null/in_null.o src/null/snddma_null.o \
src/server/sv_ccmds.o src/server/sv_ents.o src/server/sv_game.o src/server/sv_init.o src/server/sv_main.o \
src/server/sv_send.o src/server/sv_user.o src/server/sv_world.o

#src/game/g_spawn.o src/game/g_svcmds.o src/game/g_target.o src/game/g_trigger.o src/game/g_turret.o \                
# src/game/m_flash.o src/game/m_flipper.o src/game/m_float.o src/game/m_flyer.o src/game/m_gladiator.o \ 
#src/game/m_gunner.o src/game/m_hover.o src/game/m_infantry.o src/game/m_insane.o game/m_medic.c \ 

EE_CFLAGS = -D_EE -DGAME_HARD_LINKED -DPS2_QUAKE -O3 -G0 -Wformat=2 -Wall -std=c99 -I ./server -I ./ps2

EE_INCS = -I$(PS2SDK)/ee/include -I$(PS2SDK)/common/include 

EE_LDFLAGS = -L$(PS2SDK)/ee/lib

EE_LIBS = -ldma -lgraph -ldraw -lpatches -lm -lc -lkernel 
#
# Linker stuff:
#

#
# IOP/IRX modules pulled from the PS2DEV SDK:
#
IRX_PATH  = $(PS2SDK)/iop/irx
IRX_FILES = usbd.irx

EE_DVP = dvp-as

EE_VCL = vcl

EE_VCLPP = vclpp


#
# VCL/VU microprograms:
#
VCL_PATH  = src/ps2/vu1progs
VCL_FILES = color_triangles_clip_tris.vcl

PS2_LINKCMD = -mno-crt0 -T$(PS2SDK)/ee/startup/linkfile
PS2_STARTUP_FILE = $(PS2SDK)/ee/startup/crt0.o

all: $(EE_BIN) 

clean:  
	$(EE_OBJS)

include $(PS2SDK)/samples/Makefile.eeglobal
include $(PS2SDK)/samples/Makefile.pref