local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

--entity
data:extend({
  {
    type = "beacon",
    name = "ru-walkable-medium-beacon",
    icons = {{icon = "__base__/graphics/icons/beacon.png", tint = {r=202, g=154, b=152}}},
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "ru-walkable-medium-beacon"},
    max_health = 250,
    corpse = "beacon-remnants",
    dying_explosion = "beacon-explosion",
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box = {{-2.5, -3.6}, {2.5, 2.16}},
    collision_mask = {"item-layer", "object-layer", "floor-layer", "water-tile"},
    allowed_effects = {"consumption", "speed", "pollution"},

    graphics_set = require("prototypes.entity.walkable-beacon.medium-walkable-beacon-animations"),

    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    supply_area_distance = 24,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    energy_usage = "125MW",
    distribution_effectivity = 0.7,
    module_specification =
    {
      module_slots = 4,
      module_info_icon_shift = {0, 0},
      module_info_multi_row_initial_height_modifier = -0.3,
      module_info_max_icons_per_row = 2,
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/beacon/beacon-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 28,
        shift = util.by_pixel(0, 55),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
})
