data:extend({
    {
        type = "technology",
        name = "ru-logistics-b",
        hidden = "true",
        icon_size = 256,
        icons = {{icon = "__base__/graphics/technology/logistics-2.png", tint = {r=202, g=154, b=152}}},
        effects =
        {
          { type = "unlock-recipe", recipe = "ru-medium-transport-belt" },
          { type = "unlock-recipe", recipe = "ru-medium-splitter" },
          { type = "unlock-recipe", recipe = "ru-medium-underground-belt" },
          { type = "unlock-recipe", recipe = "ru-medium-loader" },
        },
        prerequisites = {"ru-logistics-a"},
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
          time = 32
        },
        order = "a-f-b"
    },
})