# Quake II port for the PlayStation 2

This is an unofficial fan made port, targeting the PS2 Console using the original
[Quake II source code released by id Software][link_id_repo].

This port relies on the free [PS2DEV SDK][link_ps2_dev] to provide rendering,
input, audio and system services for the Quake Engine.

The project is in early development stage, but 2D rendering of menus and cinematics
is implemented and working on both the PCSX2 Emulator and the PS2.

As shown in the screenshot above, we also have some basic
hardware-accelerated raw level geometry rendering implemented.

The long term goal would be to have a fully functional and playable (single-player)
Quake II on the PlayStation 2, using only on the freely available tools and libraries.

![Raw level geometry](https://raw.githubusercontent.com/glampert/quake2-for-ps2/master/misc/screenshots/q2ps2-level-notex-2.png "Raw level geometry")

## License

Quake II was originally released as GPL, and it remains as such. New code written
for the PS2 port or any changes made to the original source code are also released under the
GNU General Public License version 2. See the accompanying LICENSE file for the details.

You can also find a copy of the GPL version 2 [in here][link_gpl_v2].

## Original release notes for the Quake II source code from John Carmack:

<pre>
This is the complete source code for Quake 2, version 3.19, buildable with
Visual C++ 6.0. The Linux version should be buildable, but we haven't
tested it for the release.

The code is all licensed under the terms of the GPL (GNU public license).
You should read the entire license, but the gist of it is that you can do
anything you want with the code, including sell your new version. The catch
is that if you distribute new binary versions, you are required to make the
entire source code available for free to everyone.

The primary intent of this release is for entertainment and educational
purposes, but the GPL does allow commercial exploitation if you obey the
full license. If you want to do something commercial and you just can't bear
to have your source changes released, we could still negotiate a separate
license agreement (for $$$), but I would encourage you to just live with the GPL.

All of the Q2 data files remain copyrighted and licensed under the
original terms, so you cannot redistribute data from the original game, but if
you do a true total conversion, you can create a standalone game based on
this code.

Thanks to Robert Duffy for doing the grunt work of building this release.

John Carmack
Id Software
</pre>

[link_id_repo]: https://github.com/id-Software/Quake-2
[link_ps2_dev]: https://github.com/ps2dev
[link_gpl_v2]: https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html

# TODO-LIST:
- Migrate to gcc 11.2
- Port the code to newlib plus clang-format
- Finish Vector Unit-accelerated rendering
- Add texture mapping, lightmaps and dynamic lights
- Add sound rendering/mixing for the PS2
- Add gamepad input
- Hook `dlmalloc`
- Optimize memory allocation/usage as much as possible
- Optimize rendering to ensure smooth 30fps gameplay
