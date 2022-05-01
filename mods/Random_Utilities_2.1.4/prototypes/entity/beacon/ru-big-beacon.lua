local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

--entity
data:extend({
  {
    type = "beacon",
    name = "ru-big-beacon",
    icons = {{icon = "__base__/graphics/icons/beacon.png", tint = {r=132, g=180, b=181}}},
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "ru-big-beacon"},
    max_health = 300,
    corpse = "beacon-remnants",
    dying_explosion = "beacon-explosion",
    collision_box = {{-2.7, -2.7}, {2.7, 2.7}},
    selection_box = {{-3, -3}, {3, 3}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box = {{-3, -4.4}, {3, 2.6}},
    allowed_effects = {"consumption", "speed", "pollution"},

    graphics_set = require("prototypes.entity.beacon.big-beacon-animations"),

    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    supply_area_distance = 48,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    energy_usage = "625MW",
    distribution_effectivity = 0.8,
    module_specification =
    {
      module_slots = 5,
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
