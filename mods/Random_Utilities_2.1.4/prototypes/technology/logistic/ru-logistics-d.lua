data:extend({
    {
        type = "technology",
        name = "ru-logistics-d",
        hidden = "true",
        icon_size = 256,
        icons = {{icon = "__base__/graphics/technology/logistics-3.png", tint = {r=80, g=80, b=80}}},
        effects =
        {
          { type = "unlock-recipe", recipe = "ru-behemoth-transport-belt" },
          { type = "unlock-recipe", recipe = "ru-behemoth-splitter" },
          { type = "unlock-recipe", recipe = "ru-behemoth-underground-belt" },
          { type = "unlock-recipe", recipe = "ru-behemoth-loader" },
        },
        prerequisites = {"ru-logistics-c"},
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
        order = "a-f-b"
    },
})