--if settings.startup["ru-accumulator"].value == true then

--recipes
data:extend(
{
  {
    type = "recipe",
    name = "ru-big-accumulator",
    hidden = "true",
--    hidden = is_Big_accumulator_hidden ,
    enabled = "false",
    ingredients =
    {
      {"ru-medium-accumulator", 8},
      {"low-density-structure", 8},
      {"processing-unit", 3},
    },
    result = "ru-big-accumulator",
  },
}
)

--end
