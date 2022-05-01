--if settings.startup["ru-accumulator"].value == true then

--technologies

data:extend(
{
  {
    type = "technology",
    name = "ru-Advanced-Electric-Energy-accumulators-c",
    hidden = "true",
--    hidden = is_Big_accumulator_hidden ,
    icon_size = 256,
    icon = "__base__/graphics/technology/electric-energy-acumulators.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ru-big-accumulator"
      }
    },
    prerequisites = {"ru-Advanced-Electric-Energy-accumulators-b"},
    unit =
    {
      count = 700,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 2}
      },
      time = 33
    },
    order = "a-h-c"
  },
}
)

--end
