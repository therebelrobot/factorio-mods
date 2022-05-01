local resource_autoplace = require("resource-autoplace")

local autoplace_table = {
	name = gprefix.."tenemut",
	order = "c",
	base_density = 0.9,
	--base_spots_per_km2 = 1.25,
	base_spots_per_km2 = 1.0,
	has_starting_area_placement = true,
	random_spot_size_minimum = 2,
	random_spot_size_maximum = 4,
	regular_rq_factor_multiplier = 1
}

if settings.startup["tenemut-near-spawn"].value == false then
	autoplace_table.has_starting_area_placement = false
end

if mods["space-exploration"] then
--[[
se_default = {
  base_density = 5,
  has_starting_area_placement = true,
  name = "dmr18-tenemut",
  order = "z-dmr18-tenemut",
  regular_rq_factor_multiplier = 1.1000000000000001,
  starting_rq_factor_multiplier = 1
}
]]
	se_resources = se_resources or {}
	autoplace_table.base_density = 5
	se_resources[gprefix.."tenemut"] = autoplace_table

	se_core_fragment_resources = se_core_fragment_resources or {}
	se_core_fragment_resources[gprefix.."tenemut"] = { multiplier = 0.2, omni_multiplier = 0.01}
end

local resource = {
	type = "resource",
	name = gprefix.."tenemut",
	icon = "__dark-matter-replicators-18__/graphics/icons/tenemut.png",
	icon_size = 32,
	flags = {"placeable-neutral"},
	order = "b-b-rep",
	tree_removal_probability = 0.2,
	tree_removal_max_distance = 16 * 16,
	minable = {
		mining_particle = gprefix.."tenemut-particle",
		mining_time = 2.5,
		result = gprefix.."tenemut"
	},
	collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
	selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
	autoplace = resource_autoplace.resource_autoplace_settings(autoplace_table),
	stage_counts = {2500, 2000, 1500, 1000, 500, 250, 100, 40},
	stages = {
		sheet = {
			filename = "__dark-matter-replicators-18__/graphics/entity/tenemut.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			frame_count = 8,
			variation_count = 8,
			hr_version = {
				filename = "__dark-matter-replicators-18__/graphics/entity/hr-tenemut.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				frame_count = 8,
				variation_count = 8,
				scale = 0.5
			}
		}
	},
	map_color = {r=0.550, g=0.392, b=0.550}
}

data:extend(
{
	{
		type = "tool",
		name = gprefix.."tenemut",
		icon = "__dark-matter-replicators-18__/graphics/icons/tenemut.png",
		icon_size = 32,
		subgroup = "raw-resource",
		order = "f[tenemut]",
		stack_size = 200,
		durability = 1,
		durability_description_key = "description.science-pack-remaining-amount"
	},
	{
		type = "noise-layer",
		name = gprefix.."tenemut"
	},
	{
		type = "autoplace-control",
		name = gprefix.."tenemut",
		richness = true,
		order = "b-rep",
		category = "resource"
	},

	resource,

	{
		type = "optimized-particle",
		name = gprefix.."tenemut-particle",
		flags = {}, --{"not-on-map"},
		life_time = 180,
		pictures =
		{
			{
				filename = "__dark-matter-replicators-18__/graphics/entity/tenemut-particle-1.png",
				priority = "extra-high",
				width = 5,
				height = 5,
				frame_count = 1
			},
			{
				filename = "__dark-matter-replicators-18__/graphics/entity/tenemut-particle-2.png",
				priority = "extra-high",
				width = 6,
				height = 4,
				frame_count = 1
			},
			{
				filename = "__dark-matter-replicators-18__/graphics/entity/tenemut-particle-3.png",
				priority = "extra-high",
				width = 7,
				height = 8,
				frame_count = 1
			},
			{
				filename = "__dark-matter-replicators-18__/graphics/entity/tenemut-particle-4.png",
				priority = "extra-high",
				width = 6,
				height = 5,
				frame_count = 1
			}
		},
		shadows =
		{
			{
				filename = "__dark-matter-replicators-18__/graphics/entity/tenemut-particle-shadow-1.png",
				priority = "extra-high",
				width = 5,
				height = 5,
				frame_count = 1
			},
			{
				filename = "__dark-matter-replicators-18__/graphics/entity/tenemut-particle-shadow-2.png",
				priority = "extra-high",
				width = 6,
				height = 4,
				frame_count = 1
			},
			{
				filename = "__dark-matter-replicators-18__/graphics/entity/tenemut-particle-shadow-3.png",
				priority = "extra-high",
				width = 7,
				height = 8,
				frame_count = 1
			},
			{
				filename = "__dark-matter-replicators-18__/graphics/entity/tenemut-particle-shadow-4.png",
				priority = "extra-high",
				width = 6,
				height = 5,
				frame_count = 1
			}
		}
	},
})