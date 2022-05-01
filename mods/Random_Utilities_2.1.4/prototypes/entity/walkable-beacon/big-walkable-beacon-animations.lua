return
{
  module_icons_suppressed = true,

  animation_progress = 1,
  min_animation_progress = 0,

  module_tint_mode = "mix", -- "single-module"
  no_modules_tint = {1, 0, 0},
  random_animation_offset = true,

  apply_module_tint = "secondary",
  apply_module_tint_to_light = "none",

  -- light = { shift = {0, 0}, color = {1, 1, 1}, intensity = 1, size = 3 },
  animation_list =
  {
    {
      render_layer = "floor-mechanics",
      always_draw = true,
      animation =
      {
        layers =
        {
          {
            filename = "__Random_Utilities__/graphics/entity/beacon/walkable-beacon-bottom.png",
            width = 212,
            height = 212,
            scale = 1,
            shift = util.by_pixel(0, 0),
            tint = {r=132, g=180, b=181},
            hr_version =
            {
              filename = "__Random_Utilities__/graphics/entity/beacon/walkable-hr-beacon-bottom.png",
              width = 212,
              height = 212,
              scale = 1,
              shift = util.by_pixel(0, 0),
              tint = {r=132, g=180, b=181},
            }
          },
        }
      },
    },
    {
      render_layer = "object",
      always_draw = true,
      animation =
      {
        filename = "__Random_Utilities__/graphics/entity/beacon/walkable-beacon-antenna.png",
        width = 212,
        height = 212,
        scale = 1,
        repeat_count = 45,
        animation_speed = 0.5,
        shift = util.by_pixel(-8, -1),
        tint = {r=132, g=180, b=181},
        hr_version =
        {
          filename = "__Random_Utilities__/graphics/entity/beacon/walkable-hr-beacon-antenna.png",
          width = 212,
          height = 212,
          scale = 1,
          repeat_count = 45,
          animation_speed = 0.5,
          shift = util.by_pixel(-8, -1),
          tint = {r=132, g=180, b=181},
        }
      }
    },
    {
      render_layer = "object",
      apply_tint = true,
      draw_as_sprite = true,
      draw_as_light = true,
      always_draw = false,
      animation =
      {
        filename = "__base__/graphics/entity/beacon/beacon-light.png",
        line_length = 9,
        width = 56,
        height = 94,
        scale = 1,
        frame_count = 45,
        animation_speed = 0.5,
        shift = util.by_pixel(0, -32),
        blend_mode = "additive",
        hr_version =
        {
          filename = "__base__/graphics/entity/beacon/hr-beacon-light.png",
          line_length = 9,
          width = 110,
          height = 186,
          scale = 1,
          frame_count = 45,
          animation_speed = 0.5,
          shift = util.by_pixel(0, -32),
          blend_mode = "additive",
        }
      }
    },
  },

  module_visualisations =
  {
    -- vanilla art style
    {
      art_style = "vanilla",
      use_for_empty_slots = true,
      tier_offset = 0,
      slots =
      {
        -- slot 1
        {
          {
            has_empty_slot = true,
            render_layer = "lower-object",
            pictures =
            {
              filename = "__base__/graphics/entity/beacon/beacon-module-slot-1.png",
              line_length = 4,
              width = 26,
              height = 34,
              scale = 1,
              variation_count = 4,
              shift = util.by_pixel(-50, 42),
              hr_version =
              {
                filename = "__Random_Utilities__/graphics/entity/beacon/walkable-hr-beacon-module-slot-1.png",
                line_length = 4,
                width = 50,
                height = 66,
                scale = 1,
                variation_count = 4,
                shift = util.by_pixel(-50, 42),
              }
            }
          },
          {
            apply_module_tint = "primary",
            render_layer = "lower-object",
            pictures =
            {
              filename = "__base__/graphics/entity/beacon/beacon-module-mask-box-1.png",
              line_length = 3,
              width = 18,
              height = 16,
              scale = 1,
              variation_count = 3,
              shift = util.by_pixel(-53.125, 42),
              hr_version =
              {
                filename = "__Random_Utilities__/graphics/entity/beacon/walkable-hr-beacon-module-mask-box-1.png",
                line_length = 3,
                width = 36,
                height = 32,
                scale = 1,
                variation_count = 3,
                shift = util.by_pixel(-53.125, 42),
              }
            }
          },
          {
            apply_module_tint = "secondary",
            render_layer = "lower-object-above-shadow",
            pictures =
            {
              filename = "__base__/graphics/entity/beacon/beacon-module-mask-lights-1.png",
              line_length = 3,
              width = 14,
              height = 6,
              scale = 1,
              variation_count = 3,
              shift = util.by_pixel(-55.1, 38),
              hr_version =
              {
                filename = "__Random_Utilities__/graphics/entity/beacon/walkable-hr-beacon-module-mask-lights-1.png",
                line_length = 3,
                width = 26,
                height = 12,
                scale = 1,
                variation_count = 3,
                shift = util.by_pixel(-55.1, 38),
              }
            }
          },
          {
            apply_module_tint = "secondary",
            draw_as_light = true,
            draw_as_sprite = false,
            pictures =
            {
              filename = "__base__/graphics/entity/beacon/beacon-module-lights-1.png",
              line_length = 3,
              width = 28,
              height = 22,
              scale = 1,
              variation_count = 3,
              shift = util.by_pixel(-55.1, 38),
              hr_version =
              {
                filename = "__Random_Utilities__/graphics/entity/beacon/walkable-hr-beacon-module-lights-1.png",
                line_length = 3,
                width = 56,
                height = 42,
                scale = 1,
                variation_count = 3,
                shift = util.by_pixel(-55.1, 38),
              }
            }
          }
        },
        -- slot 2
        {
          {
            has_empty_slot = true,
            render_layer = "lower-object",
            pictures =
            {
              filename = "__base__/graphics/entity/beacon/beacon-module-slot-2.png",
              line_length = 4,
              width = 24,
              height = 22,
              scale = 1,
              variation_count = 4,
              shift = util.by_pixel(50, -42),
              hr_version =
              {
                filename = "__Random_Utilities__/graphics/entity/beacon/walkable-hr-beacon-module-slot-2.png",
                line_length = 4,
                width = 50,
                height = 66,
                scale = 1,
                variation_count = 4,
                shift = util.by_pixel(50, -42),
              }
            }
          },
          {
            apply_module_tint = "primary",
            render_layer = "lower-object",
            pictures =
            {
              filename = "__base__/graphics/entity/beacon/beacon-module-mask-box-2.png",
              line_length = 3,
              width = 18,
              height = 14,
              scale = 1,
              variation_count = 3,
              shift = util.by_pixel(53.125, -42),
              hr_version =
              {
                filename = "__Random_Utilities__/graphics/entity/beacon/walkable-hr-beacon-module-mask-box-2.png",
                line_length = 3,
                width = 36,
                height = 32,
                scale = 1,
                variation_count = 3,
                shift = util.by_pixel(53.125, -42),
              }
            }
          },
          {
            apply_module_tint = "secondary",
            render_layer = "lower-object-above-shadow",
            pictures =
            {
              filename = "__base__/graphics/entity/beacon/beacon-module-mask-lights-2.png",
              line_length = 3,
              width = 12,
              height = 8,
              scale = 1,
              variation_count = 3,
              shift = util.by_pixel(55, -46),
              hr_version =
              {
                filename = "__Random_Utilities__/graphics/entity/beacon/walkable-hr-beacon-module-mask-lights-2.png",
                line_length = 3,
                width = 26,
                height = 12,
                scale = 1,
                variation_count = 3,
                shift = util.by_pixel(55, -46),
              }
            }
          },
          {
            apply_module_tint = "secondary",
            draw_as_light = true,
            draw_as_sprite = false,
            pictures =
            {
              filename = "__base__/graphics/entity/beacon/beacon-module-lights-2.png",
              line_length = 3,
              width = 34,
              height = 24,
              scale = 1,
              variation_count = 3,
              shift = util.by_pixel(55, -46),
              hr_version = {
                filename = "__Random_Utilities__/graphics/entity/beacon/walkable-hr-beacon-module-lights-2.png",
                line_length = 3,
                width = 56,
                height = 42,
                scale = 1,
                variation_count = 3,
                shift = util.by_pixel(55, -46),
              }
            }
          }
        }
      }
    } -- end vanilla art style
  }
}
--end
