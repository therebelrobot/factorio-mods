--if settings.startup["ru-substation"].value == true then

--technologies
data:extend({
{
  type = "technology",
  name = "ru-big-substation",
  hidden = "true",
  icon_size = 256,
  icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "ru-big-substation"
    }
  },
  prerequisites = {"ru-medium-substation"},
                  --{"electric-energy-distribution-2"},
  unit =
  {
    count = 300,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"utility-science-pack", 1}
    },
    time = 33
  },
  order = "c-e-c"
},
})

--end
