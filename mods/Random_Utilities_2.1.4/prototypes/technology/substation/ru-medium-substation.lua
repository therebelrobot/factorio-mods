--if settings.startup["ru-substation"].value == true then

--technologies
data:extend({
{
  type = "technology",
  name = "ru-medium-substation",
  hidden = "true",
  icon_size = 256,
  icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "ru-medium-substation"
    }
  },
  prerequisites = {"ru-basic-substation"},
                  --{"electric-energy-distribution-2"},
  unit =
  {
    count = 250,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 32
  },
  order = "c-e-c"
},
})

--end
