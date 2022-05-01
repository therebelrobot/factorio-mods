--if settings.startup["ru-substation"].value == true then

--technologies
data:extend({
{
  type = "technology",
  name = "ru-basic-substation",
  hidden = "true",
  icon_size = 256,
  icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "ru-basic-substation"
    }
  },
  prerequisites = {"electric-energy-distribution-2"},
  unit =
  {
    count = 150,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
    },
    time = 31
  },
  order = "c-e-c"
},
})

--end
