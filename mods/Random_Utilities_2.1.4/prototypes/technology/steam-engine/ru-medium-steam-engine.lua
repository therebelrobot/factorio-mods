data:extend({
  {
    type = "technology",
    name = "ru-medium-steam-engine",
    hidden = "true",
    icon_size = 64,
    icons = {{icon = "__base__/graphics/icons/steam-engine.png", tint = {r=202, g=154, b=152}}},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ru-medium-steam-engine"
      }
    },
    prerequisites = {"ru-basic-steam-engine"},
    unit =
    {
      count = 700,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 31
    },
    order = "a-h-a"
  },
})