data:extend({
  {
    type = "technology",
    name = "ru-medium-inserter",
    hidden = "true",
    icon_size = 64,
    icons = {{icon = "__base__/graphics/icons/long-handed-inserter.png", {tint = {r=202, g=154, b=152}}}},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ru-medium-inserter"
      }
    },
    prerequisites = {"ru-basic-inserter"},
    unit =
    {
      count = 750,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 32
    },
    order = "a-h-a"
  },
})