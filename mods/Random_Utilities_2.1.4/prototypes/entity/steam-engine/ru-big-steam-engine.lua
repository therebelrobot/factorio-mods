require ("__base__/prototypes/entity/pipecovers")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
    {
        type = "generator",
        name = "ru-big-steam-engine",
        icons = {{icon = "__base__/graphics/icons/steam-engine.png", tint = {r=132, g=180, b=181}}},
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-neutral","player-creation"},
        minable = {mining_time = 0.3, result = "ru-big-steam-engine"},
        max_health = 400,
        effectivity = 2.5,
        corpse = "steam-engine-remnants",
        dying_explosion = "steam-engine-explosion",
        alert_icon_shift = util.by_pixel(3, -34),
        fluid_usage_per_tick = 30/60,
        maximum_temperature = 615,
        resistances =
        {
          {
            type = "fire",
            percent = 70
          },
          {
            type = "impact",
            percent = 30
          }
        },
        fast_replaceable_group = "steam-engine",
        next_upgrade = "ru-behemoth-steam-engine",
        collision_box = {{-1.25, -2.35}, {1.25, 2.35}},
        selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
        damaged_trigger_effect = hit_effects.entity(),
        fluid_box =
        {
          base_area = 1,
          height = 2,
          base_level = -1,
          pipe_covers = pipecoverspictures(),
          pipe_connections =
          {
            { type = "input-output", position = {0, 3} },
            { type = "input-output", position = {0, -3} }
          },
          production_type = "input-output",
          filter = "steam",
          minimum_temperature = 100.0
        },
        energy_source =
        {
          type = "electric",
          usage_priority = "secondary-output",
        },
        horizontal_animation =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/steam-engine/steam-engine-H.png",
              tint = {r=132, g=180, b=181},
              width = 176,
              height = 128,
              frame_count = 32,
              line_length = 8,
              shift = util.by_pixel(1, -5),
              hr_version =
              {
                filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-H.png",
                tint = {r=132, g=180, b=181},
                width = 352,
                height = 257,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(1, -4.75),
                scale = 0.5
              }
            },
            {
              filename = "__base__/graphics/entity/steam-engine/steam-engine-H-shadow.png",
              width = 254,
              height = 80,
              frame_count = 32,
              line_length = 8,
              draw_as_shadow = true,
              shift = util.by_pixel(48, 24),
              hr_version =
              {
                filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-H-shadow.png",
                width = 508,
                height = 160,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(48, 24),
                scale = 0.5
              }
            }
          }
        },
        vertical_animation =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/steam-engine/steam-engine-V.png",
              tint = {r=132, g=180, b=181},
              width = 112,
              height = 195,
              frame_count = 32,
              line_length = 8,
              shift = util.by_pixel(5, -6.5),
              hr_version =
              {
                filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-V.png",
                tint = {r=132, g=180, b=181},
                width = 225,
                height = 391,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(4.75, -6.25),
                scale = 0.5
              }
            },
            {
              filename = "__base__/graphics/entity/steam-engine/steam-engine-V-shadow.png",
              width = 165,
              height = 153,
              frame_count = 32,
              line_length = 8,
              draw_as_shadow = true,
              shift = util.by_pixel(40.5, 9.5),
              hr_version =
              {
                filename = "__base__/graphics/entity/steam-engine/hr-steam-engine-V-shadow.png",
                width = 330,
                height = 307,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(40.5, 9.25),
                scale = 0.5
              }
            }
          }
        },
        smoke =
        {
          {
            name = "light-smoke",
            north_position = {0.9, 0.0},
            east_position = {-2.0, -2.0},
            frequency = 10 / 32,
            starting_vertical_speed = 0.08,
            slow_down_factor = 1,
            starting_frame_deviation = 60
          }
        },
        vehicle_impact_sound = sounds.generic_impact,
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        working_sound =
        {
          sound =
          {
            filename = "__base__/sound/steam-engine-90bpm.ogg",
            volume = 0.55
          },
          match_speed_to_activity = true,
          audible_distance_modifier = 0.8,
          max_sounds_per_type = 3,
          fade_in_ticks = 4,
          fade_out_ticks = 20
        },
        min_perceived_performance = 0.25,
        performance_to_sound_speedup = 0.5,
        water_reflection =
        {
          pictures =
          {
            filename = "__base__/graphics/entity/steam-engine/steam-engine-reflection.png",
            tint = {r=132, g=180, b=181},
            priority = "extra-high",
            width = 40,
            height = 44,
            shift = util.by_pixel(0, 55),
            variation_count = 2,
            repeat_count = 2,
            scale = 5,
          },
          rotate = false,
          orientation_to_variation = true
        }
    },
})