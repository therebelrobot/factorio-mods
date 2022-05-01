local Data = require('__stdlib__/stdlib/data/data')
local Recipe = require('__stdlib__/stdlib/data/recipe')
local Tech = require('__stdlib__/stdlib/data/technology')
local defaultTech = "automation"

--Gets rid of icons field when only string is provided
function Data:replace_icons(icon, size)
    if self:is_valid() then
        if type(icon) == 'table' then
            self.icons = icon
            self.icon = nil
        else
            self.icon = icon
			self.icons = nil
        end
        self.icon_size = size or self.icon_size
    end
    if not self.icon_size then
        error('Icon present but icon size not detected')
    end
    return self
end

--This will make sense later, just trust me
micro.machines = {}
micro.machines["assembler"] = 6
micro.machines["furnace"] = 3
micro.machines["miner"] = 5
micro.machines["beacon"] = 3
micro.machines["radar"] = 5
micro.machines["chemplant"] = 4
micro.machines["fant-radar"] = 3

if micro.tech then
	if micro.assembler or micro.furnace or micro.refinery or micro.miner or micro.beacon or micro.chem or micro.electro or micro.multi or micro.tank or micro.radar then
		data:extend(
			{
				{
					type = "technology",
					name = "micro-basic",
					icon = "__micro-machines__/graphics/technology/micro-basic.png",
					icon_size = 128,
					upgrade="false",
					prerequisites =
					{
					},
					effects =
					{
					},
					unit =
					{
						count = 15,
						ingredients = 
						{
							{"automation-science-pack", 1},
						},
						time = 10
					},
					order = data.raw.technology["automation"].order.."-zz"
				},
			}
		)
		--Add basic miniaturization tech to micro prerequisites if available
		if micro.mini then
			Tech("micro-basic"):add_prereq("mini-basic")
		end
		if micro.aai then
			Tech("micro-basic"):add_prereq("electricity")
		elseif micro.fantario then
			Tech("micro-basic"):add_prereq("automation-science-pack")
			data.raw.technology["micro-basic"].unit = 
			{
				count = 1,
				ingredients = 
				{
					{"automation-science-pack", 1},
				},
				time = 2
			}
		end
	end
end

--Mostly used for compatibility with WipMod's Micro Furnaces mod
if not micro.furnace then
	micro.machines["furnace"] = 0
end

for base, maxTier in pairs(micro.machines) do
	for currTier=1,maxTier do
		machine = "micro-"..base.."-"..currTier
		prevTech = "micro-"..base.."-"..(currTier-1)
		prevMini = "mini-"..base.."-"..currTier
		if data.raw.recipe[machine] then
			oldTech = findTech(Data(machine,"recipe"):get_field("base_machine")) or defaultTech
			--If both mini machines and micro machines tech trees enabled
			if micro.tech and micro.mini then
				Data(prevMini,"technology"):copy(machine)
				Data(machine,"technology"):set_field("effects",{})
				Tech(machine):add_effect(machine,"unlock-recipe")
				Tech(machine):set_field("enabled",true)
				Recipe(machine):set_enabled(false)
				icon = "__micro-machines__/graphics/technology/micro-"..base..".png"
				Data(machine,"technology"):replace_icons(icon,128)
				unitCount = data.raw.technology[machine].unit.count
				data.raw.technology[machine].unit.count = math.ceil(3*unitCount)
				--Tier 1 requires basic tech
				if currTier == 1 then
					data.raw.technology[machine].prerequisites = {prevMini,"micro-basic"}
				else --All other tiers require previous tier
					data.raw.technology[machine].prerequisites = {prevMini,prevTech}
				end
			elseif micro.tech then --If mini machines tech is disabled
				Data(oldTech,"technology"):copy(machine)
				Data(machine,"technology"):set_field("effects",{})
				Tech(machine):add_effect(machine,"unlock-recipe")
				Tech(machine):set_field("enabled",true)
				Recipe(machine):set_enabled(false)
				icon = "__micro-machines__/graphics/technology/micro-"..base..".png"
				Data(machine,"technology"):replace_icons(icon,128)
				unitCount = data.raw.technology[machine].unit.count
				data.raw.technology[machine].unit.count = math.ceil(2*unitCount)
				--Tier 1 requires basic tech
				if currTier == 1 then
					data.raw.technology[machine].prerequisites = {oldTech,"micro-basic"}
				else --All other tiers require previous tier instead
					data.raw.technology[machine].prerequisites = {oldTech,prevTech}
				end
				fixTech(machine)
			else --Or just add it to the base technology
				Tech(oldTech):add_effect(machine,"unlock-recipe")
			end
		end
	end
end


--micro.debug(data.raw.technology["micro-assembler-4"])

--[[
if micro.tech then
	
	if Data("micro-miner-1","recipe"):is_valid() then
		findTech("electric-furnace")
		Recipe("micro-furnace-1"):add_unlock("advanced-material-processing")
	end
else
	--Recipe("micro-miner-1"):set_enabled(true)

	if Data("micro-miner-1","recipe"):is_valid() then
		findTech("electric-furnace")
		Recipe("micro-furnace-1"):add_unlock("advanced-material-processing")
	end
end
]]--