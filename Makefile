
#
# !!! NOTE: Header files are completely ignored !!!
# If you change a header file, either make clean or
# change the accompanying source files to force a rebuild!
#

EE_BIN = quake2.elf

# ---------------------------------------------------------
#  Quake 2 source files:
# ---------------------------------------------------------

#
# All C source files used by the game and the quake engine:
#
EE_OBJS = \
	src/ps2/fact3.c \
	src/ps2/tests/test_draw2d.c \
	src/ps2/tests/test_draw3d.c \
	src/ps2/builtin/backtile.c  \
	src/ps2/builtin/conback.c   \
	src/ps2/builtin/conchars.c  \
	src/ps2/builtin/help.c      \
	src/ps2/builtin/inventory.c \
	src/ps2/builtin/palette.c   \
	src/ps2/debug_print.c       \
	src/ps2/dma_mgr.c           \
	src/ps2/main_ps2.c          \
	src/ps2/math_funcs.c        \
	src/ps2/mem_alloc.c         \
	src/ps2/model_load.c        \
	src/ps2/net_ps2.c           \
	src/ps2/ref_ps2.c           \
	src/ps2/sys_ps2.c           \
	src/ps2/tex_image.c         \
	src/ps2/view_draw.c         \
	src/ps2/vec_mat.c           \
	src/ps2/vid_ps2.c           \
	src/ps2/vu1.c               \
	src/ps2/vu_prog_mgr.c       \
	src/client/cl_cin.c         \
	src/client/cl_ents.c        \
	src/client/cl_fx.c          \
	src/client/cl_input.c       \
	src/client/cl_inv.c         \
	src/client/cl_main.c        \
	src/client/cl_newfx.c       \
	src/client/cl_parse.c       \
	src/client/cl_pred.c        \
	src/client/cl_scrn.c        \
	src/client/cl_tent.c        \
	src/client/cl_view.c        \
	src/client/console.c        \
	src/client/keys.c           \
	src/client/menu.c           \
	src/client/qmenu.c          \
	src/client/snd_dma.c        \
	src/client/snd_mem.c        \
	src/client/snd_mix.c        \
	src/common/cmd.c            \
	src/common/cmodel.c         \
	src/common/common.c         \
	src/common/crc.c            \
	src/common/cvar.c           \
	src/common/filesys.c        \
	src/common/md4.c            \
	src/common/net_chan.c       \
	src/common/pmove.c          \
	src/game/g_ai.c             \
	src/game/g_chase.c          \
	src/game/g_cmds.c           \
	src/game/g_combat.c         \
	src/game/g_func.c           \
	src/game/g_items.c          \
	src/game/g_main.c           \
	src/game/g_misc.c           \
	src/game/g_monster.c        \
	src/game/g_phys.c           \
	src/game/g_save.c           \
	src/game/g_spawn.c          \
	src/game/g_svcmds.c         \
	src/game/g_target.c         \
	src/game/g_trigger.c        \
	src/game/g_turret.c         \
	src/game/g_utils.c          \
	src/game/g_weapon.c         \
	src/game/m_actor.c          \
	src/game/m_berserk.c        \
	src/game/m_boss2.c          \
	src/game/m_boss3.c          \
	src/game/m_boss31.c         \
	src/game/m_boss32.c         \
	src/game/m_brain.c          \
	src/game/m_chick.c          \
	src/game/m_flash.c          \
	src/game/m_flipper.c        \
	src/game/m_float.c          \
	src/game/m_flyer.c          \
	src/game/m_gladiator.c      \
	src/game/m_gunner.c         \
	src/game/m_hover.c          \
	src/game/m_infantry.c       \
	src/game/m_insane.c         \
	src/game/m_medic.c          \
	src/game/m_move.c           \
	src/game/m_mutant.c         \
	src/game/m_parasite.c       \
	src/game/m_soldier.c        \
	src/game/m_supertank.c      \
	src/game/m_tank.c           \
	src/game/p_client.c         \
	src/game/p_hud.c            \
	src/game/p_trail.c          \
	src/game/p_view.c           \
	src/game/p_weapon.c         \
	src/game/q_shared.c         \
	src/null/cd_null.c          \
	src/null/in_null.c          \
	src/null/snddma_null.c      \
	src/server/sv_ccmds.c       \
	src/server/sv_ents.c        \
	src/server/sv_game.c        \
	src/server/sv_init.c        \
	src/server/sv_main.c        \
	src/server/sv_send.c        \
	src/server/sv_user.c        \
	src/server/sv_world.c

EE_ASM = usbd_irx.o

BIN2S = $(PS2SDK)/bin/bin2s

EE_CFLAGS = -D_EE -DGAME_HARD_LINKED -DPS2_QUAKE -O3 -G0 -Wformat=2 -Wall -std=c99 -I ./server -I ./ps2

EE_INCS = -I$(PS2SDK)/ee/include -I$(PS2SDK)/iop/include/ -Isrc/client -Isrc/common -Isrc/game -Isrc/null -I src/ps2 -Isrc/ps2/builtin -Isrc/ps2/dlmalloc -Isrc/ps2/tests -Isrc/server

EE_LDFLAGS = -L$(PS2SDK)/ee/lib -L$(PS2SDK)/iop/lib/ 

EE_LIBS = -ldmakit -lgraph -ldraw -lpatches -lm -lc -lkernel 

usbd_irx.s: $(PS2SDK)/iop/irx/usbd.irx
	$(BIN2S) $< $@ usbd_irx

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

all: $(EE_BIN) $(EE_ASM)

clean:  
	$(EE_ASM)

include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal