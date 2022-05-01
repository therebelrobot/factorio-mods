--if settings.startup["ru-accumulator"].value == true then

--technologies

data:extend(
{
  {
    type = "technology",
    name = "ru-Advanced-Electric-Energy-accumulators-d",
    hidden = "true",
--    hidden = is_Behemoth_accumulator_hidden ,
    icon_size = 256,
    icon = "__base__/graphics/technology/electric-energy-acumulators.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ru-behemoth-accumulator"
      }
    },
    prerequisites = {"ru-Advanced-Electric-Energy-accumulators-c"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 34
    },
    order = "a-h-c"
  },
}
)

--end
