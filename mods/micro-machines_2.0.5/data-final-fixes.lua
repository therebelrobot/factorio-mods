--Reference the file where the magic happens
require 'func'
local Data = require('__stdlib__/stdlib/data/data')

--micro.debug(data.raw["assembling-machine"]["assembling-machine-2"].fluid_boxes)

--Replace "if false then" with other mods later
if micro.assembler then
	if micro.bobs.assembler then
		if not mods["reskins-bobs"] then 
			newIcon = "__micro-machines__/graphics/assembler/assembling-machine-6.png"
			Data("assembling-machine-6","item"):replace_icon(newIcon,32)
		end
		microsize("assembling-machine","assembling-machine","micro-assembler",6)
	elseif micro.industrevolution then
		--do nothing for now, compatibility tbd
	elseif micro.fxp.assembler then
		microsize("assembling-machine","assembling-machine","micro-assembler",5)
	elseif micro.fantario then
		microsize("assembling-machine","assembling-machine","micro-assembler",4)
	elseif micro.modmash then
		microsize("assembling-machine","assembling-machine","micro-assembler",5)
	else
		microsize("assembling-machine","assembling-machine","micro-assembler",3)
	end
end


if micro.furnace then
	--Need to change bobs furnaces to assemblers first
	if micro.bobs.furnace and micro.krastorio2 then
		--Only if furnaces haven't been modified by mini machines
		if data.raw.furnace["electric-furnace-2"] then
			furnaceToAssembler()
		end
		microsize("assembling-machine","electric-furnace","micro-furnace",3)
	elseif micro.bobs.furnace then
		microsize("furnace","electric-furnace","micro-furnace",3)
	elseif micro.industrevolution then
		--do nothing for now, compatibility tbd
	elseif micro.elecfurnaces and micro.krastorio2 then
		--Only if furnaces haven't been modified by mini machines
		if data.raw.furnace["electric-furnace-2"] then
			furnaceToAssembler()
		end
		microsize("assembling-machine","electric-furnace","micro-furnace",3)
		data.raw.item["kr-advanced-furnace"].order = data.raw.item["micro-furnace-3"].order.."-z"
	elseif micro.elecfurnaces then
		microsize("furnace","electric-furnace","micro-furnace",3)
	elseif micro.fxp.furnace then
		microsize("furnace","electric-furnace","micro-furnace",3)
	elseif micro.krastorio2 then
		microsize("assembling-machine","electric-furnace","micro-furnace",1)
		data.raw.item["kr-advanced-furnace"].order = data.raw.item["micro-furnace-1"].order.."-z"
	elseif micro.fantario then
		microsize("assembling-machine","electric-furnace-1","micro-furnace",1)
	else
		microsize("furnace","electric-furnace","micro-furnace",1)
	end
end
if micro.miner then
	if micro.bobs.miner then
		microsize("mining-drill","electric-mining-drill","micro-miner",1)
		microsize("mining-drill","bob-mining-drill","micro-miner",4)
	elseif micro.industrevolution then
		--do nothing for now, compatibility tbd
	elseif micro.fxp.miner then
		microsize("mining-drill","electric-mining-drill","micro-miner",3)
	elseif micro.fantario then
		microsize("mining-drill","uran-mining-drill","micro-uran-miner",1)
		microsize("mining-drill","electric-mining-drill","micro-miner",1)
	elseif micro.krastorio2 then
		microsize("mining-drill","electric-mining-drill","micro-miner",3)
		Data("micro-miner-3","mining-drill"):remove_field("next_upgrade")
	else
		microsize("mining-drill","electric-mining-drill","micro-miner",1)
	end
end

if micro.beacon then
	if micro.bobs.beacon then
		microsize("beacon","beacon","micro-beacon",3)
	elseif micro.fxp.beacon then
		microsize("beacon","beacon","micro-beacon",3)
	else
		microsize("beacon","beacon","micro-beacon",1)
	end
end
if micro.radar then
	if micro.bobs.radar then
		microsize("radar","radar","micro-radar",5)
	elseif micro.fxp.radar then
		data.raw["radar"]["radar-mk2"].next_upgrade = nil
		microsize("radar","radar","micro-radar",2)
	elseif micro.krastorio2 then
		microsize("radar","radar","micro-radar",1)
		Data("micro-radar-1","radar"):remove_field("next_upgrade")
	elseif micro.fantario then
		microsize("radar","radar","micro-fant-radar",3)
	else
		microsize("radar","radar","micro-radar",1)
	end
end

--Reference the file where the tech tree is established
require 'tech'
--data.raw["radar"]["micro-radar-1"].next_upgrade = nil
--micro.debug(data.raw["assembling-machine"]["assembling-machine-3"])
--micro.debug(data.raw.technology["micro-assembler-4"])







