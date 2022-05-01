data:extend({
    {
        type = "technology",
        name = "ru-logistics-c",
        hidden = "true",
        icon_size = 256,
        icons = {{icon = "__base__/graphics/technology/logistics-3.png", tint = {r=132, g=180, b=181}}},
        effects =
        {
          { type = "unlock-recipe", recipe = "ru-big-transport-belt" },
          { type = "unlock-recipe", recipe = "ru-big-splitter" },
          { type = "unlock-recipe", recipe = "ru-big-underground-belt" },
          { type = "unlock-recipe", recipe = "ru-big-loader" },
        },
        prerequisites = {"ru-logistics-b"},
        unit =
        {
          count = 1500,
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
        order = "a-f-b"
    },
})