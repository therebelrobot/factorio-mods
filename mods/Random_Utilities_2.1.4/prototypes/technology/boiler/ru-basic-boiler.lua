data:extend({
    {
      type = "technology",
      name = "ru-basic-boiler",
      hidden = "true",
      icon_size = 64,
      icons = {{icon = "__base__/graphics/icons/boiler.png", tint = {r=178, g=173, b=100}}},
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "ru-basic-boiler"
        }
      },
      prerequisites = {"steel-processing"},
      unit =
      {
        count = 500,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
        },
        time = 31
      },
      order = "a-h-a"
    },
  })