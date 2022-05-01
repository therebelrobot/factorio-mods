require("prototypes.entity.logistic.belt.graphic.ru-big-transport-belt")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
  {
    type = "splitter",
    name = "ru-big-splitter",
    icons = {{icon = "__base__/graphics/icons/express-splitter.png", tint = {r=132, g=180, b=181}}},
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "ru-big-splitter"},
    max_health = 400,
    corpse = "express-splitter-remnants",
    dying_explosion = "express-splitter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    belt_animation_set = ru_big_transport_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "ru-behemoth-splitter",
    speed = 180 / 480,
    working_sound = sounds.express_splitter,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-north.png",
        tint = {r=132, g=180, b=181},
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 82,
        height = 36,
        shift = util.by_pixel(6, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-north.png",
          tint = {r=132, g=180, b=181},
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 160,
          height = 70,
          shift = util.by_pixel(7, 0),
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-east.png",
        tint = {r=132, g=180, b=181},
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 44,
        shift = util.by_pixel(4, 12),
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-east.png",
          tint = {r=132, g=180, b=181},
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 84,
          shift = util.by_pixel(4, 13),
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-south.png",
        tint = {r=132, g=180, b=181},
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 82,
        height = 32,
        shift = util.by_pixel(4, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-south.png",
          tint = {r=132, g=180, b=181},
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 64,
          shift = util.by_pixel(4, 0),
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-west.png",
        tint = {r=132, g=180, b=181},
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 44,
        shift = util.by_pixel(6, 12),
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-west.png",
          tint = {r=132, g=180, b=181},
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 94,
          height = 86,
          shift = util.by_pixel(5, 12),
          scale = 0.5
        }
      }
    },
    structure_patch =
    {
      north = util.empty_sprite(),
      east =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-east-top_patch.png",
        tint = {r=132, g=180, b=181},
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 52,
        shift = util.by_pixel(4, -20),
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-east-top_patch.png",
          tint = {r=132, g=180, b=181},
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 104,
          shift = util.by_pixel(4, -20),
          scale = 0.5
        }
      },
      south = util.empty_sprite(),
      west =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-west-top_patch.png",
        tint = {r=132, g=180, b=181},
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 48,
        shift = util.by_pixel(6, -18),
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-west-top_patch.png",
          tint = {r=132, g=180, b=181},
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 94,
          height = 96,
          shift = util.by_pixel(5, -18),
          scale = 0.5
        }
      }
    }
  },
})