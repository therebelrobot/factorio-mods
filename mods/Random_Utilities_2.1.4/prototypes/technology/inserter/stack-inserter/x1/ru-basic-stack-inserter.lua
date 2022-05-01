data:extend({
  {
    type = "technology",
    name = "ru-basic-stack-inserter",
    hidden = "true",
    icons = {{icon = "__base__/graphics/icons/stack-inserter.png",tint = {r=178, g=173, b=100}}},
    icon_size = 64,
    effects =
    {
      {type = "unlock-recipe", recipe = "ru-basic-stack-inserter"},
      {type = "stack-inserter-capacity-bonus", modifier = 2}
    },
    prerequisites = {"stack-inserter"},
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
      time = 31
    },
    upgrade = true,
    order = "c-o-a"
  },
})