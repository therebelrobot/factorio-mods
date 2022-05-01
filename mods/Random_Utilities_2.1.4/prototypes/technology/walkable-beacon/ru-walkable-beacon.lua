--technology
data:extend({
  {
    type = "technology",
    name = "ru-walkable-beacon-upgrade",
    hidden = "true",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/effect-transmission.png",
    effects = {
      {type = "unlock-recipe", recipe = "ru-walkable-beacon",},
      --[[{type = "unlock-recipe", recipe = "ru-walkable-basic-beacon"},
      {type = "unlock-recipe", recipe = "ru-walkable-medium-beacon"},
      {type = "unlock-recipe", recipe = "ru-walkable-big-beacon",},--]]
    },
    prerequisites = {"effect-transmission"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 31
    },
    order = "i-i"
  },
  {
    type = "technology",
    name = "ru-walkable-beacon-downgrade",
    hidden = "true",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/effect-transmission.png",
    effects = {
      {type = "unlock-recipe", recipe = "ru-walkable-beacon-Recycle",},
      --[[{type = "unlock-recipe", recipe = "ru-walkable-basic-beacon-Recycle"},
      {type = "unlock-recipe", recipe = "ru-walkable-medium-beacon-Recycle"},
      {type = "unlock-recipe", recipe = "ru-walkable-big-beacon-Recycle",},--]]
      },
    prerequisites = {"ru-walkable-beacon-upgrade"},
    unit =
      {
      count = 450,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 32
    },
    order = "i-i"
  },
})
