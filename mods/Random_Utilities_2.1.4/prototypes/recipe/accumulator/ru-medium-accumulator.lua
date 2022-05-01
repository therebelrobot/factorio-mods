--if settings.startup["ru-accumulator"].value == true then

--recipes
data:extend(
{
  {
    type = "recipe",
    name = "ru-medium-accumulator",
    hidden = "true",
--    hidden = is_Medium_accumulator_hidden ,
    enabled = false,
    ingredients =
    {
      {"ru-basic-accumulator", 8},
      {"low-density-structure", 8},
      {"processing-unit", 3},
    },
    result = "ru-medium-accumulator",
  },
}
)

--end
