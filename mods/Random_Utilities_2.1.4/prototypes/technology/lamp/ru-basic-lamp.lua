--if settings.startup["ru-lamp"].value == true then

--technologies
data:extend({
  {
    type = "technology",
    name = "ru-basic-lamp",
    hidden = "true",
    icon_size = 256,
    icon = "__base__/graphics/technology/optics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ru-basic-lamp"
      }
    },
    prerequisites = {"optics"},
    unit =
    {
      count = 20,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 18
    },
    order = "a-h-a"
  },
})




--end
