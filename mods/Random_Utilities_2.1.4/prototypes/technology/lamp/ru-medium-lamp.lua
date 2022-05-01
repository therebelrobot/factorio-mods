--if settings.startup["ru-lamp"].value == true then

--technologies
data:extend({
  {
    type = "technology",
    name = "ru-medium-lamp",
    hidden = "true",
    icon_size = 256,
    icon = "__base__/graphics/technology/optics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ru-medium-lamp"
      }
    },
    prerequisites = {"ru-basic-lamp"},
    unit =
    {
      count = 50,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 32
    },
    order = "a-h-a"
  },
})




--end
