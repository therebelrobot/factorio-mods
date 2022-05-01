--if settings.startup["ru-lamp"].value == true then

--technologies
data:extend({
  {
    type = "technology",
    name = "ru-behemoth-lamp",
    hidden = "true",
    icon_size = 256,
    icon = "__base__/graphics/technology/optics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ru-behemoth-lamp"
      }
    },
    prerequisites = {"ru-big-lamp"},
    unit =
    {
      count = 100,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 34
    },
    order = "a-h-a"
  },
})




--end
