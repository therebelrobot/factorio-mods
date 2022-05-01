data:extend({
  {
    type = "technology",
    name = "ru-behemoth-stack-inserter",
    hidden = "true",
    icons = {{icon = "__base__/graphics/icons/stack-inserter.png",tint = {r=80, g=80, b=80}}},
    icon_size = 64,
    effects =
    {
      {type = "unlock-recipe", recipe = "ru-behemoth-stack-inserter"},
      {type = "stack-inserter-capacity-bonus", modifier = 10}
    },
    prerequisites = {"ru-big-stack-inserter"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 34
    },
    upgrade = true,
    order = "c-o-a"
  },
})