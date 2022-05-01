--if settings.startup["ru-substation"].value == true then

--technologies
data:extend({
{
  type = "technology",
  name = "ru-behemoth-substation",
  hidden = "true",
  icon_size = 256,
  icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "ru-behemoth-substation"
    }
  },
  prerequisites = {"ru-big-substation"},
                  --{"electric-energy-distribution-2"},
  unit =
  {
    count = 500,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"utility-science-pack", 1}
    },
    time = 34
  },
  order = "c-e-c"
},
})

--end
