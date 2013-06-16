-- dsprotectxz/init.lua
-- see readme.txt for credits, license and detailed information about the mod

-- config
dsprotectxzheight = 201
dsprotectxznodename = "default:dirt" -- optional visual presentation of protection - line can be commented out - see below
dsprotectxztile = "default_cloud.png" -- name of png to use for protection block at x,dsprotectxzheight,z - or use empty texture

minetest.register_privilege("dsprotectxz", "Remove protective block")

minetest.register_node("dsprotectxz:block", {
	description = "Protection block",
	tiles = {dsprotectxztile},
	groups = {not_in_creative_inventory=1},
})

minetest.register_tool("dsprotectxz:protectwand", {
	description = "Protect wand",
	inventory_image = "dsprotectxz_protectwand.png",
	wield_image = "dsprotectxz_protectwand.png",

	on_use = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end	
		pos = pointed_thing.under
		pos2 = {x=pos.x,y=dsprotectxzheight,z=pos.z}
		local pnmeta = minetest.env:get_meta(pos2)
		if (pnmeta:get_string("owner") == "") then
			local tstr = "This area was was owned by ("..pnmeta:get_string("owner")..")"
			minetest.set_node(pos2, {name="dsprotectxz:block"})
			pnmeta:set_string("owner", placer:get_player_name() or "")
			minetest.set_node(pos, {name=dsprotectxznodename})  -- optional visual presentation of protection - line can be commented out
			tstr = tstr.." and is now owned by ("..pnmeta:get_string("owner")..")"
			minetest.chat_send_player(placer:get_player_name(),tstr)
		end
	end,
})

minetest.register_tool("dsprotectxz:protectionwand", {
description = "Protection wand",
inventory_image = "dsprotectxz_protectionwand.png",
wield_image = "dsprotectxz_protectionwand.png",

on_use = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end	
		pos = pointed_thing.under
		pos2 = {x=pos.x,y=dsprotectxzheight,z=pos.z}
		local pnmeta = minetest.env:get_meta(pos2)
		local tstr = "This area is owned by ("..pnmeta:get_string("owner")..")"
		minetest.chat_send_player(placer:get_player_name(),tstr)
	end,
})

minetest.register_tool("dsprotectxz:unprotectwand", {
description = "Unprotect wand",
inventory_image = "dsprotectxz_unprotectwand.png",
wield_image = "dsprotectxz_unprotectwand.png",

on_use = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end	
		pos = pointed_thing.under
		pos2 = {x=pos.x,y=dsprotectxzheight,z=pos.z}
		local pnmeta = minetest.env:get_meta(pos2)
		if (pnmeta:get_string("owner") == placer:get_player_name() or minetest.get_player_privs(placer:get_player_name()).dsprotectxz) then
			local tstr = "This area was was owned by ("..pnmeta:get_string("owner")..")"
			minetest.remove_node(pos2)
			tstr = tstr.." and is now owned by ("..pnmeta:get_string("owner")..")"
			minetest.chat_send_player(placer:get_player_name(),tstr)
		end
	end,
})

-- simplified from glomie's mod

local old_node_dig = minetest.node_dig

function minetest.node_dig(pos, node, digger)
	pos2 = {x=pos.x,y=dsprotectxzheight,z=pos.z}
	local pnmeta = minetest.env:get_meta(pos2)
	print(pnmeta:get_string("owner"))
	if(pnmeta:get_string("owner")==digger:get_player_name()  or pnmeta:get_string("owner")=="") then
		old_node_dig(pos, node, digger)
	end
end

local old_node_place = minetest.item_place

function minetest.item_place(itemstack, placer, pointed_thing)
	if itemstack:get_definition().type == "node" then
		local pos = pointed_thing.above
		pos2 = {x=pos.x,y=dsprotectxzheight,z=pos.z}
		local pnmeta = minetest.env:get_meta(pos2)
		print(pnmeta:get_string("owner"))
		if(pnmeta:get_string("owner")==placer:get_player_name()  or pnmeta:get_string("owner")=="") then
			return old_node_place(itemstack, placer, pointed_thing)
		end
	end
end