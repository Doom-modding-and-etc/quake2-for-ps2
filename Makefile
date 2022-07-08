#
# !!! NOTE: Header files are completely ignored !!!
# If you change a header file, either make clean or
# change the accompanying source files to force a rebuild!
#

EE_BIN = build/quake2.elf

# ---------------------------------------------------------
#  Quake 2 source files:
# ---------------------------------------------------------

EE_OBJS = \
	ps2/fact3.c \
	ps2/builtin/backtile.c  \
	ps2/builtin/conback.c   \
	ps2/builtin/conchars.c  \
	ps2/builtin/help.c      \
	ps2/builtin/inventory.c \
	ps2/builtin/palette.c   \
	ps2/debug_print.c       \
	ps2/dma_mgr.c           \
	ps2/main_ps2.c          \
	ps2/math_funcs.c        \
	ps2/mem_alloc.c         \
	ps2/model_load.c        \
	ps2/net_ps2.c           \
	ps2/ref_ps2.c           \
	ps2/sys_ps2.c           \
	ps2/tex_image.c         \
	ps2/view_draw.c         \
	ps2/vec_mat.c           \
	ps2/vid_ps2.c           \
	ps2/vu1.c               \
	ps2/vu_prog_mgr.c       \
	client/cl_cin.c         \
	client/cl_ents.c        \
	client/cl_fx.c          \
	client/cl_input.c       \
	client/cl_inv.c         \
	client/cl_main.c        \
	client/cl_newfx.c       \
	client/cl_parse.c       \
	client/cl_pred.c        \
	client/cl_scrn.c        \
	client/cl_tent.c        \
	client/cl_view.c        \
	client/console.c        \
	client/keys.c           \
	client/menu.c           \
	client/qmenu.c          \
	client/snd_dma.c        \
	client/snd_mem.c        \
	client/snd_mix.c        \
	common/cmd.c            \
	common/cmodel.c         \
	common/common.c         \
	common/crc.c            \
	common/cvar.c           \
	common/filesys.c        \
	common/md4.c            \
	common/net_chan.c       \
	common/pmove.c          \
	game/g_ai.c             \
	game/g_chase.c          \
	game/g_cmds.c           \
	game/g_combat.c         \
	game/g_func.c           \
	game/g_items.c          \
	game/g_main.c           \
	game/g_misc.c           \
	game/g_monster.c        \
	game/g_phys.c           \
	game/g_save.c           \
	game/g_spawn.c          \
	game/g_svcmds.c         \
	game/g_target.c         \
	game/g_trigger.c        \
	game/g_turret.c         \
	game/g_utils.c          \
	game/g_weapon.c         \
	game/m_actor.c          \
	game/m_berserk.c        \
	game/m_boss2.c          \
	game/m_boss3.c          \
	game/m_boss31.c         \
	game/m_boss32.c         \
	game/m_brain.c          \
	game/m_chick.c          \
	game/m_flash.c          \
	game/m_flipper.c        \
	game/m_float.c          \
	game/m_flyer.c          \
	game/m_gladiator.c      \
	game/m_gunner.c         \
	game/m_hover.c          \
	game/m_infantry.c       \
	game/m_insane.c         \
	game/m_medic.c          \
	game/m_move.c           \
	game/m_mutant.c         \
	game/m_parasite.c       \
	game/m_soldier.c        \
	game/m_supertank.c      \
	game/m_tank.c           \
	game/p_client.c         \
	game/p_hud.c            \
	game/p_trail.c          \
	game/p_view.c           \
	game/p_weapon.c         \
	game/q_shared.c         \
	null/cd_null.c          \
	null/in_null.c          \
	null/snddma_null.c      \
	server/sv_ccmds.c       \
	server/sv_ents.c        \
	server/sv_game.c        \
	server/sv_init.c        \
	server/sv_main.c        \
    server/sv_send.c        \
	server/sv_user.c        \
	server/sv_world.c

EE_ASM = usbd_irx.s
BIN2S = $(PS2SDK)/bin/bin2s
EE_CFLAGS = -D_EE -DGAME_HARD_LINKED -DPS2_QUAKE -O3 -G0 -Wformat=2 -Wall -std=c99 -I ./client -I ./common -I ./game -I ./null -I ./server -I ./ps2
EE_INCS = -I$(PS2SDK)/ee/include -I$(PS2SDK)/iop/include/ 
EE_LDFLAGS = -L$(PS2SDK)/ee/lib -L$(PS2SDK)/iop/lib/ 
EE_LIBS = -ldmakit -lgraph -ldraw -lpatches -lm -lc -lkernel 

#WIP
#ps2/tests/test_draw2d.c 
#ps2/tests/test_draw3d.c 

usbd_irx.s: $(PS2SDK)/iop/irx/usbd.irx
	$(BIN2S) $< $@ usbd_irx

EE_DVP = dvp-as

EE_VCL = vcl

EE_VCLPP = vclpp

#
# VCL/VU microprograms:
#
VCL_PATH = ps2/vu1progs
VCL_FILES = color_triangles_clip_tris.vcl

PS2_LINKCMD = -mno-crt0 -T$(PS2SDK)/ee/startup/linkfile
PS2_STARTUP_FILE = $(PS2SDK)/ee/startup/crt0.o

all: $(EE_BIN) $(EE_ASM)

clean:  
	$(EE_ASM)

include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal
