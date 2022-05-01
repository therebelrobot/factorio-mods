data:extend({
  {
    type = "technology",
    name = "ru-big-inserter",
    hidden = "true",
    icon_size = 64,
    icons = {{icon = "__base__/graphics/icons/fast-inserter.png", {tint = {r=132, g=180, b=181}}}},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ru-big-inserter"
      }
    },
    prerequisites = {"ru-medium-inserter"},
    unit =
    {
      count = 1250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 33
    },
    order = "a-h-a"
  },
})