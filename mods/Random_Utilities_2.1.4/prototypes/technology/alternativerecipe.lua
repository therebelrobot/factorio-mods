--if settings.startup["ru-lamp"].value == true then

--technologies
data:extend({
  {
    type = "technology",
    name = "landfill-2",
    hidden = "true",
    icon_size = 128,
    icon = "__base__/graphics/technology/landfill.png",
    effects =
    {
      {type = "unlock-recipe",recipe = {"easy-landfill",}},
      {type = "unlock-recipe",recipe = { "wood-to-landfill",}},
    },
    prerequisites = {"landfill"},
    unit =
    {
      count = 25,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 20
    },
    order = "a-h-a"
  },
})




--end
