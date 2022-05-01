--Data contains all functions contained in the Factorio stdlib
local Data = require('__stdlib__/stdlib/data/data')
local Recipe = require('__stdlib__/stdlib/data/recipe')
local Tech = require('__stdlib__/stdlib/data/technology')

--List of entity types that can be microaturized. Used in place of a switch statement from C.
local entityTypes = {
	"assembling-machine",
	"furnace",
	"mining-drill",
	"beacon",
	"radar",
	"storage-tank"
}

local folderNames = {
	"assembler",
	"furnace",
	"miner",
	"beacon",
	"radar",
	"chemplant",
	"refinery",
	"tank",
	"electro",
	"bobchem",
	"bobmetal",
	"bobmulti"
}

local demoTech = {
	"electric-mining",
	"radar",
}

local fields = {
    "shift", 
    "scale", 
    "collision_box",
    "selection_box",
    "north_position", 
    "south_position", 
    "east_position", 
    "west_position",
    "window_bounding_box",
    "circuit_wire_connection_points",
}

local ignored_fields ={
    "fluid_boxes",
    "fluid_box",
    "energy_source",
    "input_fluid_box",
}

--Additional helper functions added to local Data object
function Data:rescale_entity(scale)
	if self:is_valid() then
		rescale_entity(self._raw, scale)
	end
end

function Data:fixPipeConnections()
	if self.fluid_boxes then
		if string.match(self.name, "assembler") then
			self.fluid_boxes[1].pipe_connections = {{ type="input", position = {0, -1} }}
			self.fluid_boxes[2].pipe_connections = {{ type="output", position = {0, 1} }}
		end
		if string.match(self.name, "refinery") then
			self.fluid_boxes[1].pipe_connections = {{ type="input", position = {-1, 2} }}
			self.fluid_boxes[2].pipe_connections = {{ type="input", position = {1, 2} }}
			self.fluid_boxes[3].pipe_connections = {{ type="output", position = {-1, -2} }}
			self.fluid_boxes[4].pipe_connections = {{ type="output", position = {0, -2} }}
			self.fluid_boxes[5].pipe_connections = {{ type="output", position = {1, -2} }}
		end
		if string.match(self.name, "chemplant") then
			self.fluid_boxes[1].pipe_connections = {{ type="input", position = {-0.5, -1.5} }}
			self.fluid_boxes[2].pipe_connections = {{ type="input", position = {0.5, -1.5} }}
			self.fluid_boxes[3].pipe_connections = {{ type="output", position = {-0.5, 1.5} }}
			self.fluid_boxes[4].pipe_connections = {{ type="output", position = {0.5, 1.5} }}
		end
		if string.match(self.name, "electro") then
			self.fluid_boxes[1].pipe_connections = {{ type="input", position = {-0.5, -1.5} }}
			self.fluid_boxes[2].pipe_connections = {{ type="input", position = {0.5, -1.5} }}
			self.fluid_boxes[3].pipe_connections = {{ type="output", position = {-0.5, 1.5} }}
			self.fluid_boxes[4].pipe_connections = {{ type="output", position = {0.5, 1.5} }}
		end
		if string.match(self.name, "bobmetal") then
			self.fluid_boxes[1].pipe_connections = {{ type="input", position = {0.5, -1.5} }}
			self.fluid_boxes[2].pipe_connections = {{ type="output", position = {0.5, 1.5} }}
		end
		if string.match(self.name, "bobchem") then
			self.fluid_boxes[1].pipe_connections = {{ type="input-output", position = {0.5, -1.5} }}
		end
		if string.match(self.name, "bobmulti") then
			self.fluid_boxes[1].pipe_connections = {{ type="input-output", position = {0.5, -1.5} }}
		end
	end
	if self.fluid_box then
		self.fluid_box.base_area = (self.fluid_box.base_area / 2)
		if self.fluid_box.pipe_connections[1] then
			self.fluid_box.pipe_connections[1].position = {-0.5,-1.5}
			self.fluid_box.pipe_connections[2].position = {1.5,0.5}
			self.fluid_box.pipe_connections[3].position = {0.5,1.5}
			self.fluid_box.pipe_connections[4].position = {-1.5,-0.5}
			if self.fluid_box.pipe_connections[5] then
				self.fluid_box.pipe_connections[5].position = {0.5,-1.5}
				self.fluid_box.pipe_connections[6].position = {1.5,-0.5}
				self.fluid_box.pipe_connections[7].position = {-1.5,0.5}
				self.fluid_box.pipe_connections[8].position = {-0.5,1.5}
			end
		end
	end
	if self.input_fluid_box then
		self.input_fluid_box.pipe_connections =
		{
			{ position = {0, 0.75} }
		}
	end
	if string.match(self.name,"miner") then
		self.vector_to_place_result = {0, -0.75}
	end
	if self.energy_source then
		if self.energy_source.connections then
			for _, data in pairs(self.energy_source.connections) do
				if data.direction == 0 then data.position={0,-0.5} end
				if data.direction == 2 then data.position={0.5,0} end
				if data.direction == 4 then data.position={0,0.5} end
				if data.direction == 6 then data.position={-0.5,0} end
			end
		end
	end
end

function Data:fixHeatConnections()
	if self.energy_source then
		if self.energy_source.type == "heat" then
			self.energy_source.connections = {
				{direction=2,position={0,0}},
				{direction=6,position={0,0}},
				{direction=0,position={0,0}},
				{direction=4,position={0,0}}
			}
		end
	end
end

function Data:balanceRecipe()
	if self:is_valid() then
		if micro.recipeCost ~= 100 then
			local scalar = (micro.recipeCost/100)
			reduceIngredients(self.ingredients, scalar)
			if self.normal then
				reduceIngredients(self.normal.ingredients, scalar)
			end
			if self.expensive then
				reduceIngredients(self.expensive.ingredients, scalar)
			end
		end
	end
end

function Data:fixIcon()
	if self:is_valid() then
		local intro = "__micro-machines__/graphics/"
		local machineType = ""
		local modFlavor = "vanilla/"
		local ending = ".png"
		
		--New icons handling method begins here
		local shrinkPath = "__micro-machines__/graphics/shrink3.png"
		--If not using shiny powerbars; they look bad together
		if not micro.shinybobs.bars then
			if self.icons then --If icons group already exists, simply add shrink arrows
				table.insert(self.icons,{icon=shrinkPath,icon_size=64})
			elseif self.icon then --Otherwise, create new icons group with shrink arrows
				local old_icon_size = self.icon_size or 32
				local old_icon_mipmaps = self.icon_mipmaps
				self.icons = {{icon=self.icon,icon_size=old_icon_size, icon_mipmaps=old_icon_mipmaps},{icon=shrinkPath,icon_size=64}}
			end
		end
	end
end

function Data:reorder()
	if self:is_valid() then
		self.order = self.order.."-zz"
	end
end

function Recipe:replace_results(old_name, new_name)
	if self:is_valid() then
		if self.results then
			for _, result in pairs(self.results) do
				for key, object in pairs(result) do
					if object == old_name then result[key] = new_name end
				end
			end
		end
		if self.normal then
			if self.normal.results then
				for _, result in pairs(self.normal.results) do
					for key, object in pairs(result) do
						if object == old_name then result[key] = new_name end
					end
				end
			end
		end
		if self.expensive then
			if self.expensive.results then
				for _, result in pairs(self.expensive.results) do
					for key, object in pairs(result) do
						if object == old_name then result[key] = new_name end
					end
				end
			end
		end
		self:set_main_product(new_name,new_name,new_name)
	end
end

--Instantiates the entire set of item, recipe, and entity for micro machine.
--	entityType	= string; type of entity e.g. "assembling-machine"
--	entityBase	= string; machine name minus tier e.g. "oil-refinery"
--	entitymicro	= string; name for micro machine set minus tier e.g. "micro-refinery"
--	maxTier		= int; max tier in set of machines (defined in final-fixes based on modlist)
function microsize(entityType, entityBase, entitymicro, maxTier)
	for n=1,maxTier do
		--Set name of the current and next tier
		local baseCurrent = entityBase.."-"..n
		local basePrev = entityBase.."-"..(n-1)
		local microCurrent = entitymicro.."-"..n
		local microNext = entitymicro.."-"..(n+1)
		local microPrev = entitymicro.."-"..(n-1)
		local values = {}

		--Special handling for bobs mining drills
		if entityBase == "bob-mining-drill" then
			microCurrent = entitymicro.."-"..(n+1)
			microNext = entitymicro.."-"..(n+2)
			microPrev = entitymicro.."-"..n
			if n == 1 then
				basePrev = "electric-mining-drill"
				microPrev = "micro-miner-1"
			end
		end
		if string.match(microCurrent,"bobmulti") and n == 1 then
				basePrev = "chemical-furnace"
				microPrev = "micro-bobchem-1"
		end
		--Special handling for factorio extended plus machines
		if micro.fxp.enabled and n > 1 then
			if entitymicro == "micro-furnace" or entitymicro == "micro-radar" or entitymicro == "micro-refinery" or entitymicro == "micro-chemplant" or entitymicro == "micro-miner" or entitymicro == "micro-tank" then
				baseCurrent = entityBase.."-mk"..n
				if n > 2 then
					basePrev = entityBase.."-mk"..(n-1)
				end
			end
		end
		--Special handling for krastorio2 mining drills
		if micro.krastorio2 and string.match(entitymicro,"miner") then
			if n > 1 then 
				baseCurrent = "kr-"..entityBase.."-mk"..n
				basePrev = entityBase.."-"..n
				if n > 2 then
					basePrev = "kr-"..entityBase.."-mk"..n
				end
			end
		end
		--Special handling for Fantario radars
		if string.match(microCurrent,"fant") then
			if n == 1 then
				baseCurrent = "radar"
			elseif n == 2 then
				baseCurrent = "heat-radar"
				basePrev = "radar"
			elseif n == 3 then
				baseCurrent = "elec-radar"
				basePrev = "heat-radar"
			end
		end

		if not Data(baseCurrent,"item"):is_valid() then
			baseCurrent = entityBase
		end
		if n>1 and not Data(basePrev,"item"):is_valid() then
			basePrev = entityBase
		end
--[[
		values = {baseCurrent,entityType,microCurrent}
		if baseCurrent == "electric-furnace-1" then micro.debug(Data(baseCurrent,"item")) end
]]--
		--Copy the item, recipe, and entity data of baseCurrent and name as microCurrent
		Data(baseCurrent,"item"):copy(microCurrent)
		Data(baseCurrent,"recipe"):copy(microCurrent)
		Data(baseCurrent,entityType):copy(microCurrent)

		--Fixes upgrade from previous machine
		Recipe(microCurrent):replace_ingredient(basePrev,microPrev)

		--Fixes results for current machine
		Recipe(microCurrent):replace_results(baseCurrent,microCurrent)

		--Base machine field is used later by tech.lua to trace originating technology
		if Data(microCurrent,"recipe"):get_field("base_machine") then
			Data(microCurrent,"recipe"):set_field("base_machine")
		else
			Data(microCurrent,"recipe"):set_field("base_machine",baseCurrent)
		end
		
		--Shrinks down the entity itself
		if string.match(entitymicro,"refinery") then
			--Refinery not implemented
			Data(microCurrent,entityType):rescale_entity((3/5))
		else Data(microCurrent,entityType):rescale_entity((1/3))
		end

		--Apply balance changes to recipe
		Data(microCurrent,"recipe"):balanceRecipe()
		
		--Fixes the pipe connection positions
		Data(microCurrent,entityType):fixPipeConnections()
		Data(microCurrent,entityType):fixHeatConnections()

		--Properly sets the next_upgrade target, if one should exist
		if Data(microCurrent,entityType):get_field("next_upgrade") then
			if string.match(microCurrent,"bobchem") or string.match(microCurrent,"bobmetal") then
				microNext = "micro-bobmulti-1"
			end
			Data(microCurrent,entityType):set_field("next_upgrade",microNext)
		end

		--Force main_product field, in case of Amator's mods
		Recipe(microCurrent):set_main_product(microCurrent,microCurrent,microCurrent)

		--
		Data(microCurrent,"item"):reorder()
		Data(microCurrent,"item"):fixIcon()
		Data(microCurrent,"recipe"):fixIcon()
		Data(microCurrent,entityType):fixIcon()
		Data(microCurrent,entityType):set_field("show_recipe_icon",micro.altInfo)
	end
end

function checkModFlavor(machineType)
	local modFlavor = "vanilla/"
	--Check for matching bobs machines
	if micro.bobs.assembler and machineType == "assembler" then
		modFlavor = "bobs/"
	elseif micro.bobs.furnace and machineType == "furnace" then
		modFlavor = "bobs/"
	elseif micro.bobs.refinery and machineType == "refinery" then
		modFlavor = "bobs/"
	elseif micro.bobs.chemplant and machineType == "chemplant" then
		modFlavor = "bobs/"
	elseif micro.bobs.miner and machineType == "miner" then
		modFlavor = "bobs/"
	elseif micro.bobs.beacon and machineType == "beacon" then
		modFlavor = "bobs/"
	elseif micro.bobs.tank and machineType == "tank" then
		modFlavor = "bobs/"
	elseif micro.bobs.radar and machineType == "radar" then
		modFlavor = "bobs/"
	elseif machineType == "electro" then
		modFlavor = "bobs/"
	elseif machineType == "bobmetal" then
		modFlavor = "bobs/"
	elseif machineType == "bobchem" then
		modFlavor = "bobs/"
	elseif machineType == "bobmulti" then
		modFlavor = "bobs/"
	end
	--Check for shinybobs
	if micro.shinybobs.assemblers and machineType == "assembler" then
		modFlavor = "shiny/"
	elseif micro.shinybobs.furnaces and machineType == "furnace" then
		modFlavor = "shiny/"
	elseif micro.shinybobs.enabled and machineType == "miner" and micro.bobs.miner then
		modFlavor = "shiny/"
	elseif micro.shinybobs.enabled and machineType == "beacon" and micro.bobs.beacon then
		modFlavor = "shiny/"
	elseif micro.shinybobs.enabled and machineType == "tank" and micro.bobs.tank then
		modFlavor = "shiny/"
	elseif micro.shinybobs.enabled and machineType == "radar" and micro.bobs.radar then
		modFlavor = "shiny/"
	elseif micro.shinybobs.enabled and machineType == "electro" then
		modFlavor = "shiny/"
	elseif micro.shinybobs.enabled and machineType == "bobmetal" then
		modFlavor = "shiny/"
	elseif micro.shinybobs.enabled and machineType == "bobchem" then
		modFlavor = "shiny/"
	elseif micro.shinybobs.enabled and machineType == "bobmulti" then
		modFlavor = "shiny/"
	--Refinery graphics are different between shinybobs and shinyangels
	elseif micro.shinybobs.enabled and machineType == "refinery" then
		modFlavor = "shinybobs/"
	end
	--Check for angels petrochem
	if micro.angels.chemplant and machineType == "chemplant" then
		modFlavor = "angels/"
	end
	--Check for shinyangels
	if micro.shinyangels.colors and machineType == "chemplant" then
		modFlavor = "shiny/"
	--Refinery graphics are different between shinybobs and shinyangels
	elseif micro.shinyangels.colors and machineType == "refinery" then
		modFlavor = "shinyangels/"
	end
	--Check for Factorio Extended Plus
	if micro.fxp.assembler and machineType == "assembler" then
		modFlavor = "fxp/"
	elseif micro.fxp.furnace and machineType == "furnace" then
		modFlavor = "fxp/"
	elseif micro.fxp.refinery and machineType == "refinery" then
		modFlavor = "fxp/"
	elseif micro.fxp.chemplant and machineType == "chemplant" then
		modFlavor = "fxp/"
	elseif micro.fxp.miner and machineType == "miner" then
		modFlavor = "fxp/"
	elseif micro.fxp.beacon and machineType == "beacon" then
		modFlavor = "fxp/"
	elseif micro.fxp.tank and machineType == "tank" then
		modFlavor = "fxp/"
	elseif micro.fxp.radar and machineType == "radar" then
		modFlavor = "fxp/"
	end
	--Check for Krastorio
	if micro.krastorio and (machineType == "miner" or machineType == "furnace")then 
		modFlavor = "krastorio/"
	end
	--Check for Krastorio
	if micro.krastorio2 and (machineType == "miner" --[[or machineType == "furnace"]])then 
		modFlavor = "krastorio2/"
	end
	--Check for Fantario
	if micro.fantario and (machineType == "assembler" or machineType == "chemplant" or machineType == "miner" or machineType == "radar" or machineType == "refinery") then
		modFlavor = "fantario/"
	end

	return modFlavor
end

--The below 2 functions (scale, rescale_entity) were a gift from Kirazy
--Many thanks go to Kirazy for helping to make micro machines even better!

-- Scales values within object
function scale(object, scale)
    -- Walk table and scale values contained within
    local function scale_subtable(object, scale)
        for key, value in pairs(object) do
            if type(value) == "table" then
                scale_subtable(value, scale)
            elseif type(value) == "number" then
                object[key] = value*scale
            end
        end
    end

    -- Check if we're a number
    if type(object) == "number" then
        return object*scale
    -- Object is a table
    elseif type(object) == "table" then
        -- Break reference, work on local copy
        object = table.deepcopy(object)
        -- Recursively call scale_subtable
        scale_subtable(object, scale)
        return object
    end
end

function rescale_entity(entity, scalar)
	for key, value in pairs(entity) do
		-- This section checks to see where we are, and for the existence of scale.
		-- Scale is defined if it is missing where it should be present.

		-- This checks to see if we're within an hr_version table
		if key == "hr_version" then
			entity.scale = entity.scale or 0.5
		-- If we're not, see if there's a filename, which means we're in a low-res table
		elseif entity.filename then
			entity.scale = entity.scale or 1
		end

        -- Check to see if we need to scale this key's value
        for n = 1, #fields do
            if fields[n] == key then
                entity[key] = scale(value, scalar)
                -- Move to the next key rather than digging down further
                goto continue
            end
        end

        -- Check to see if we need to ignore this key
        for n = 1, #ignored_fields do
            if ignored_fields[n] == key then
                -- Move to the next key rather than digging down further
                goto continue
            end
        end

        if(type(value) == "table") then
            rescale_entity(value, scalar)
        end

        -- Label to skip to next iteration
        ::continue::
    end
end

function reduceIngredients(ingredientList, scale)
	if type(ingredientList) == "table" then
		for _, ingredient in pairs(ingredientList) do
			for key, object in pairs(ingredient) do
				if type(object) == "number" then
					ingredient[key] = math.floor(object*scale+0.5)
				end
			end
		end
	end
end

--Returns the name of the technology that unlocks this recipe
function findTech(recipe)
	local name = nil
	for _, tech in pairs(data.raw.technology) do
		if tech.effects then
			for _, unlock in pairs(tech.effects) do
				if unlock.type == "unlock-recipe" then
					if unlock.recipe == recipe then
						name = tech.name
					end
				end
			end
		end
	end
	--if not name then micro.debug(recipe) end
	return name
end

--Check all the prereqs of a technology and remove them if they are disabled (demo techs)
function fixTech(technology)
	if data.raw.technology[technology]then
		for _, prereq in pairs(data.raw.technology[technology].prerequisites) do
			if data.raw.technology[prereq] then
				for _, tech in pairs(demoTech) do
					if prereq == tech then
						Tech(technology):remove_prereq(prereq)
					end
				end
			end
		end
	end
end

function furnaceToAssembler()
	data.raw["assembling-machine"]["electric-furnace-2"] = data.raw.furnace["electric-furnace-2"]
	data.raw["assembling-machine"]["electric-furnace-3"] = data.raw.furnace["electric-furnace-3"]

	data.raw["assembling-machine"]["electric-furnace-2"].type = "assembling-machine"
	data.raw["assembling-machine"]["electric-furnace-3"].type = "assembling-machine"

	data.raw["assembling-machine"]["electric-furnace-2"].source_inventory_size = 2
	data.raw["assembling-machine"]["electric-furnace-3"].source_inventory_size = 2

	data.raw.furnace["electric-furnace-2"] = nil
	data.raw.furnace["electric-furnace-3"] = nil

	data.raw["assembling-machine"]["electric-furnace"].energy_usage = "372kW"
	data.raw["assembling-machine"]["electric-furnace-2"].energy_usage = "558kW"
	data.raw["assembling-machine"]["electric-furnace-3"].energy_usage = "744kW"
end













