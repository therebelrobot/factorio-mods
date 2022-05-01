--Now that Factorio supports in-game settings, the DMR mod is no longer configured by editing the start of this file.

--Stats for the first tier of replicators
local speed_base = settings.startup["replstats-speed-base"].value
local energy_base = settings.startup["replstats-energy-base"].value
local pollution_base = settings.startup["replstats-pollution-base"].value
local size_base = settings.startup["replstats-size-base"].value
local module_slots_base = settings.startup["replstats-modules-base"].value

--Every time the replictor tier increases by 1 its stats are multiplied by these numbers
local speed_factor = settings.startup["replstats-speed-factor"].value
local energy_factor = settings.startup["replstats-energy-factor"].value
local pollution_factor = settings.startup["replstats-pollution-factor"].value

--Every time the replictor tier increases by 1 its stats are added to these numbers
--Both of these are rounded down after addition
local size_addend = settings.startup["replstats-size-addend"].value 
local module_slots_addend = settings.startup["replstats-modules-addend"].value

--Research settings
local space_lock_tier = settings.startup["replresearch-space-lock"].value


function make_replicator(tier, ingredients, research_prerequisites, research_cost, also_unlocks)
	if tier >= space_lock_tier then
		--If this tier requires space science packs then the other science pack prerequisites will need to have already been researched and are therefore redundant
		research_prerequisites = {}
		--If this tier is at or after a space-locked tier, make its research require space science packs
		research_cost.ingredients[#research_cost.ingredients + 1] = {"space-science-pack", 1} 
	end
	--If this is the first space-locked tier then space science packs are a prerequisite
	if tier == space_lock_tier then
		research_prerequisites[#research_prerequisites + 1] = "space-science-pack"
	end
	
	--Add the previous tier of replication as a requried prerequisite
	if tier > 1 then
		research_prerequisites[#research_prerequisites + 1] = gprefix.."replication-"..(tier-1)
	end
	
	--Add the previous tier of replicator as a requried ingredient
	if tier > 1 then
		ingredients[#ingredients + 1] = {gprefix.."replicator-"..(tier-1), 1}
	end
	
	--Calculate how much energy this replicator uses
	local power_consumption = (energy_base * energy_factor^(tier-1))
	
	--If this is not the last tier of replicator, mark down that it can be upgraded to a later tier
	--Also, only mark the upgrade if this replicator is the same size as the next tier of replicator
	local next_upgrade = nil;
	if tier < 5 and math.max(1, math.floor(size_base + size_addend * (tier-1))) == math.max(1, math.floor(size_base + size_addend * (tier))) then
		next_upgrade = gprefix.."replicator-"..tier+1;
	end
	
	--Calculate the size values
	local entity_corner = math.max(1, math.floor(size_base + size_addend * (tier-1))) / 2
	local hitbox_corner = entity_corner - 0.2
	local pipe_connector_offset = 0
	--You can't center a fluid pipe on an even-sized edge, so nudge the connection point half a square to the left if that's the case
	if math.floor(entity_corner) == entity_corner then
		pipe_connector_offset = -0.5
	end
	
	--Create the list of recipe categories that this replicator can replicate
	local categories = {}
	for currentAndLowerTiers=1,tier do
		categories[#categories+1] = gprefix.."replication-"..currentAndLowerTiers
	end
	
	--Create the list of recipes which this replicator unlocks
	local effects = {}
	if also_unlocks then
		for _,current_item in ipairs(also_unlocks) do
			effects[#effects + 1] = {type = "unlock-recipe", recipe = current_item}
		end
	end
	effects[#effects + 1] = {type = "unlock-recipe", recipe = gprefix.."replicator-"..tier}

	--Create the replicator's placed machine form
	local entity = {
		--Basic stuff
		type = "assembling-machine",
		name = gprefix.."replicator-"..tier,
		icon = "__dark-matter-replicators-18__/graphics/icons/replicator-"..tier..".png",
		icon_size = 32,
		
		--Placement data
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {mining_time = 0.2, result = gprefix.."replicator-"..tier},
		fast_replaceable_group = gprefix.."replicator",
		next_upgrade = next_upgrade,
		
		--Taking damage and dying
		max_health = 150 + tier * 50,
		resistances = {
			{
				type = "fire",
				percent = 40 + tier * 10
			}
		},
		dying_explosion = "big-explosion",
		corpse = "big-remnants",
		
		--Hitbox data
		collision_box = {{-hitbox_corner, -hitbox_corner}, {hitbox_corner, hitbox_corner}},
		selection_box = {{-entity_corner, -entity_corner}, {entity_corner, entity_corner}},
		
		--Pipe connections
		fluid_boxes =
		{
			{
				production_type = "output",
				pipe_picture = assembler2pipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 10,
				base_level = 1,
				pipe_connections = {{type="output", position = {pipe_connector_offset, entity_corner + 0.5}}},
				secondary_draw_orders = {north = -1}
			},
			off_when_no_fluid_recipe = true
		},
		
		--Graphics
		animation =
		{
			filename = "__dark-matter-replicators-18__/graphics/entity/replicator-"..tier..".png",
			priority="high",
			width = 113,
			height = 91,
			frame_count = 33,
			line_length = 11,
			animation_speed = 1/3,
			shift = {entity_corner * 0.4 / 3, entity_corner * 0.1},
			scale = entity_corner * 2 / 3
		},
		
		--Sounds
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		working_sound = {
			sound = {
				{
				filename = "__base__/sound/lab.ogg",
				volume = 0.7
				},
			},
			idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
			apparent_volume = 1.5,
		},
		
		--What this machine actually does (which in this case is crafting, albeit with a set of recipes which do not require any ingredients)
		crafting_categories = categories,
		crafting_speed = speed_base * speed_factor^(tier-1),
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = pollution_base * pollution_factor^(tier-1)
		},
		energy_usage = power_consumption.."kW",
		ingredient_count = -0, --Haha no ingredients
		
		--Module slots
		module_specification =
		{
			module_slots = math.max(0, math.floor(module_slots_base + module_slots_addend * (tier-1)))
		},
		allowed_effects = {"consumption", "speed", "productivity", "pollution"} --Productivity is only here to allow raw productivity and god modules to be used
	}

	if mods["space-exploration"] and settings.startup["replication-in-space"].value then
		entity.se_allow_in_space = true
	end
	
	--Now that all the appropriate calculations have been performed, create the prototypes for the actual replicator
	data:extend({
		--Create the prototype for the replicator's technology
		{
			type = "technology",
			name = gprefix.."replication-"..tier,
			icon = "__dark-matter-replicators-18__/graphics/icons/replicator-"..tier..".png",
			icon_size = 32,
			effects = effects,
			prerequisites = research_prerequisites,
			unit = research_cost,
			upgrade = true,
			order = "a-r-"..tier
		},
		
		--Create the prototype for the replicator's recipe
		{
			type = "recipe",
			name = gprefix.."replicator-"..tier,
			enabled = "false",
			ingredients = ingredients,
			result = gprefix.."replicator-"..tier,
			subgroup = gprefix.."replicators",
			order = "b"..tier,
		},
		
		--Create the replicator's item form
		{
			type = "item",
			name = gprefix.."replicator-"..tier,
			icon = "__dark-matter-replicators-18__/graphics/icons/replicator-"..tier..".png",
			icon_size = 32,
			subgroup = "production-machine",
			order = "b"..tier,
			place_result = gprefix.."replicator-"..tier,
			stack_size = 50
		},
		
		--Create the crafting catagory for recipes of this replicator's tier
		{
			type = "recipe-category",
			name = gprefix.."replication-"..tier
		},
		entity,
	})
end


--Create the replicators using the above function
		--make_replicator(tier, ingredients, research_prerequisites, research_cost, also_unlocks)
make_replicator(1,
	{
		{"iron-plate", 4},
		{"electronic-circuit", 2},
		{gprefix.."dark-matter-scoop", 4},
	},
	{"electronics"},
	research(25, 1, 0, 0, 0, 0, 0, 0, 30),
	{gprefix.."dark-matter-scoop", gprefix.."replication-lab"}
)
make_replicator(2,
	{
		{"electronic-circuit", 4},
		{gprefix.."dark-matter-transducer", 2},
	},
	{"logistic-science-pack"},
	research(50, 1, 1, 0, 0, 0, 0, 0, 30),
	{gprefix.."dark-matter-transducer"}
)
make_replicator(3,
	{
		{"advanced-circuit", 2},
		{gprefix.."dark-matter-transducer", 4},
	},
	{"chemical-science-pack"},
	research(100, 1, 1, 0, 1, 0, 0, 0, 30),
	{}
)
make_replicator(4,
	{
		{"advanced-circuit", 4},
		{gprefix.."matter-conduit", 2},
	},
	{"production-science-pack"},
	research(200, 1, 1, 0, 1, 1, 0, 0, 30),
	{gprefix.."matter-conduit"}
)
make_replicator(5,
	{
		{"processing-unit", 2},
		{gprefix.."matter-conduit", 4},
	},
	{"utility-science-pack"},
	research(400, 1, 1, 0, 1, 1, 1, 0, 30),
	{}
)
