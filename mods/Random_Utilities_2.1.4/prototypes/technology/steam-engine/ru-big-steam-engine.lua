data:extend({
  {
    type = "technology",
    name = "ru-big-steam-engine",
    hidden = "true",
    icon_size = 64,
    icons = {{icon = "__base__/graphics/icons/steam-engine.png", tint = {r=132, g=180, b=181}}},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ru-big-steam-engine"
      }
    },
    prerequisites = {"ru-medium-steam-engine"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 33
    },
    order = "a-h-a"
  },
})