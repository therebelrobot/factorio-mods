--technology
data:extend({
{
  type = "technology",
  name = "ru-advanced-effect-transmission-b",
  hidden = "true",
  icon_size = 256, icon_mipmaps = 4,
  icon = "__base__/graphics/technology/effect-transmission.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "ru-medium-beacon"
    }
  },
  prerequisites = {"ru-advanced-effect-transmission-a"},
  unit =
  {
    count = 600,
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
