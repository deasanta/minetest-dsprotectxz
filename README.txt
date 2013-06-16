Subject: [Mod] dsprotectxz [0.1] [dsprotectxz]

Very basic mod to protect a 1 x ∞ x 1 area by placing a cloud at a given hight with protection meta data in it.
Based on: glomie's protector mod

Picture - http://dl.dropboxusercontent.com/u/1389294/minetest/dsprotectxz.png

Item: dsprotectxz:protectwand - Wand to protect a column of blocks at X,,Z
Item: dsprotectxz:protectionwand - Wand to check protection of blocks at X,,Z
Item: dsprotectxz:unprotectwand - Wand to unprotect a column of blocks at X,,Z
privilege: dsprotectxz - Grant / Revoke user's right to remove a protective block

GitHub: https://github.com/deasanta/minetest-dsprotectxz/
Download: https://github.com/deasanta/minetest-dsprotectxz/archive/master.zip

License: (see README.txt)
Sourcecode: WTFPL
Textures: WTFPL

Mod dependencies: default

Mod conflicts: (Unknown)

Compatibility:
This mod should work with on Minetest 0.4.6 and 0.4.7

Installation: add to mods folder and change as you like

Configuration: see init.lua

Notes:
 - mod is named "dsprotectxz" - use grep or search/replace function to change to what you want
 - there are no crafts for this mod to keep it simple and open to modification - use the /giveme dsprotectxz:protectwand command to get started
 - depends on default but easy to change in config area of init.lua so that it does not have to
 - there may be other mods with similar functions that may even work better
 - at the time of writing this mod the engine allowed us check blocks quite far away - this may not always be the case
 - error checking is minimal - can be increased if required
 - interaction feedback in minimal - can be increased if required
 - feel free to rework this mod as you like and but respect copyright of other authors - see readme.txt
 - i'm not a lua expert, advice on how to code these mods better or more efficiently will be appreciated

----------------------
License of source code
----------------------
This work (this custom mod, by deasanta) is free of known copyright restrictions.

See also:
http://minetest.net/
See README.txt in each mod directory for information about other authors.

License:
Sourcecode: WTFPL (see below)
Grahpics: WTFPL (see below)
Models: WTFPL (see below)

minetest - Copyright (C) 2013 celeron55, Perttu Ahola <celeron55@gmail.com

         DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO. 
  
  http://www.wtfpl.net/