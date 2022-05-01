--I literally just use this so I don't have to type error(serpent.block(x)) everywhere
--I guess I can also use it for error checking a little bit
function micro.debug(object)
	msg = "\n\nSomething went wrong with Mini Machines."
	msg = msg .. "\nPlease contact the mod author (Kryzeth) if you see this message."
	msg = msg .. "\nDon't forget to mention any relevant mods (bobs, angels, FXP, etc).\n\n"
	error(msg..serpent.block(object))
end