--if settings.startup["ru-substation"].value == true then

local hit_effects = require("__base__/prototypes/entity/hit-effects")

--Entity
data:extend({
{
  type = "electric-pole",
  name = "ru-medium-substation",
  icons = {{icon = "__base__/graphics/icons/substation.png", tint = {r=202, g=154, b=152}}},
  icon_size = 64, icon_mipmaps = 4,
  flags = {"placeable-neutral", "player-creation"},
  minable = {mining_time = 0.2, result = "ru-medium-substation"},
  max_health = 250,
  corpse = "substation-remnants",
  fast_replaceable_group = "substation",
  next_upgrade = "ru-big-substation",
  dying_explosion = "substation-explosion",
  track_coverage_during_build_by_moving = true,
  radius_visualisation_picture =
  {
    filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
    width = 12,
    height = 12,
    priority = "high"
  },
  connection_points =
  {
    {
      shadow =
      {
        copper = {2.55, 0.4},
        green = {2.0, 0.4},
        red = {3.05, 0.4}
      },
      wire =
      {
        copper = {-0.03, -2.5},
        green = {-0.35,-2.5},
        red = {0.25,-2.5}
      }
    },
    {
      shadow =
      {
        copper = {2.9, 0.1},
        green = {2.6, -0.15},
        red = {3.25, 0.35}
      },
      wire =
      {
        copper = {0.05, -2.75},
        green = {-0.15, -2.9},
        red = {0.25, -2.55}
      }
    },
    {
      shadow =
      {
        copper = {1.5, -0.2},
        green = {1.5, -0.55},
        red = {1.5, 0.1}
      },
      wire =
      {
        copper = {-0.43, -2.4},
        green = {-0.43, -2.63},
        red = {-0.43, -2.2}
      }
    },
    {
      shadow =
      {
        copper = {2.88, 0.2},
        green = {3.2, -0.1},
        red = {2.45, 0.4}
      },
      wire =
      {
        copper = {0, -2.7},
        green = {0.22, -2.85},
        red = {-0.24, -2.55}
      }
    }
  },
  resistances =
  {
    {
      type = "fire",
      percent = 90
    }
  },
  collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
  selection_box = {{-1, -1}, {1, 1}},
  damaged_trigger_effect = hit_effects.entity({{-0.5, -2.5}, {0.5, 0.5}}),
  drawing_box = {{-1, -3}, {1, 1}},
  maximum_wire_distance = 48,
  supply_area_distance = 21,
  pictures =
  {
    layers =
    {

      {
        filename = "__base__/graphics/entity/substation/substation.png",
        priority = "high",
        width = 70,
        height = 136,
        direction_count = 4,
        shift = util.by_pixel(0, 1-32),
        tint = {r=202, g=154, b=152},
        hr_version =
        {
          filename = "__base__/graphics/entity/substation/hr-substation.png",
          priority = "high",
          width = 138,
          height = 270,
          direction_count = 4,
          shift = util.by_pixel(0, 1-32),
          tint = {r=202, g=154, b=152},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/substation/substation-shadow.png",
        priority = "high",
        width = 186,
        height = 52,
        direction_count = 4,
        shift = util.by_pixel(62, 42-32),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/substation/hr-substation-shadow.png",
          priority = "high",
          width = 370,
          height = 104,
          direction_count = 4,
          shift = util.by_pixel(62, 42-32),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
  }
},
})

--end
