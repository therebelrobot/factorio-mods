require("prototypes.entity.logistic.belt.graphic.ru-medium-transport-belt")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

--if not mods["miniloader"] then
data:extend({  
  {
    type = "loader-1x1",
    name = "ru-medium-loader",
    icons = {{icon = "__Random_Utilities__/graphics/icons/loader/loader-1x/loader-icon-base.png", tint = {r=202, g=154, b=152}}},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-loader-1x",
    max_health = 170,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "ru-medium-loader"},
    filter_count = 5,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 32,
    belt_animation_set = ru_medium_transport_belt_animation_set,
    container_distance = 1,
    speed = 120/480,
    structure_render_layer = "lower-object",
    fast_replaceable_group = "loader-1x",
    next_upgrade = "ru-big-loader",
    structure =
    {
      direction_in =
      {
        sheets = {
          -- Base
          {
            filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/loader-structure-base.png",				
            width = 96,
            height = 96,
            tint = {r=202, g=154, b=152},
            y = 0,
            hr_version = {
              filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/hr-loader-structure-base.png",
              height = 192,
              priority = "extra-high",
              tint = {r=202, g=154, b=152},
              scale = 0.5,
              width = 192,
              y = 0
            }
          },
          -- Mask
          {
            filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/loader-structure-mask.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            y = 0,
            tint = {r=202, g=154, b=152},
            hr_version = {
              filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/hr-loader-structure-mask.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              y = 0,
              tint = {r=202, g=154, b=152},
              scale = 0.5,
            }
          },
          -- Shadow
          {
            filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/loader-structure-shadow.png",	
            priority = "extra-high",
            width = 96,
            height = 96,
            y = 0,		
            draw_as_shadow = true,
            hr_version = {
              filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/hr-loader-structure-shadow.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              y = 0,
              draw_as_shadow = true,
              scale = 0.5,
            }
          }
        }
      },
      direction_out =
      {
        sheets = {
          -- Base
          {
            filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/loader-structure-base.png",			
            width = 96,
            height = 96,
            tint = {r=202, g=154, b=152},
            y = 96,
            hr_version = {
              filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/hr-loader-structure-base.png",
              height = 192,
              priority = "extra-high",
              tint = {r=202, g=154, b=152},
              scale = 0.5,
              width = 192,
              y = 192
            }
          },
          -- Mask
          {
            filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/loader-structure-mask.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            y = 96,
            tint = {r=202, g=154, b=152},
            hr_version = {
              filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/hr-loader-structure-mask.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              y = 192,
              tint = {r=202, g=154, b=152},
              scale = 0.5,
            }
          },
          -- Shadow
          {
            filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/loader-structure-shadow.png",			
            priority = "extra-high",
            width = 96,
            height = 96,
            y = 96,
            draw_as_shadow = true,
            hr_version = {
              filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/hr-loader-structure-shadow.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              y = 192,
              draw_as_shadow = true,
              scale = 0.5,
            }
          }
        }
      },
      back_patch = {
        sheet = {
          filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/loader-structure-back-patch.png",
          priority = "extra-high",
          tint = {r=202, g=154, b=152},
          width = 96,
          height = 96,
          hr_version = {
            filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/hr-loader-structure-back-patch.png",
            priority = "extra-high",
            tint = {r=202, g=154, b=152},
            width = 192,
            height = 192,
            scale = 0.5
          }
        }
      },
      front_patch = {
        sheet = {
          filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/loader-structure-front-patch.png",
          priority = "extra-high",
          tint = {r=202, g=154, b=152},
          width = 96,
          height = 96,
          hr_version = {
            filename = "__Random_Utilities__/graphics/entity/loader/loader-1x/hr-loader-structure-front-patch.png",
            priority = "extra-high",
            tint = {r=202, g=154, b=152},
            width = 192,
            height = 192,
            scale = 0.5
          }
        }
      }
    }
  },
})
--end