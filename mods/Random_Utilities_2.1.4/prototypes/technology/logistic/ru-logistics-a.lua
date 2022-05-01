data:extend({
    {
        type = "technology",
        name = "ru-logistics-a",
        hidden = "true",
        icon_size = 256,
        icons = {{icon = "__base__/graphics/technology/logistics-1.png", tint = {r=178, g=173, b=100}}},
        effects =
        {
          { type = "unlock-recipe", recipe = "ru-basic-transport-belt" },
          { type = "unlock-recipe", recipe = "ru-basic-splitter" },
          { type = "unlock-recipe", recipe = "ru-basic-underground-belt" },
          { type = "unlock-recipe", recipe = "ru-basic-loader" },
        },
        prerequisites = {"logistics-3"},
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
        order = "a-f-b"
    },
})