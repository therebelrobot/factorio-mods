--technology
data:extend({
{
  type = "technology",
  name = "ru-advanced-effect-transmission-c",
  hidden = "true",
  icon_size = 256, icon_mipmaps = 4,
  icon = "__base__/graphics/technology/effect-transmission.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "ru-big-beacon"
    }
  },
  prerequisites = {"ru-advanced-effect-transmission-b"},
  unit =
  {
    count = 1200,
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
  order = "i-i"
},
})
