--technology
data:extend({
{
  type = "technology",
  name = "ru-advanced-effect-transmission-a",
  hidden = "true",
  icon_size = 256, icon_mipmaps = 4,
  icon = "__base__/graphics/technology/effect-transmission.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "ru-basic-beacon"
    }
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
})
