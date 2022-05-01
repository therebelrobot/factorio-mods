--if settings.startup["ru-accumulator"].value == true then

--recipes
data:extend(
{
  {
    type = "recipe",
    name = "ru-basic-accumulator",
    hidden = "true",
--    hidden = is_Basic_accumulator_hidden ,
    enabled = "false",
    ingredients =
    {
      {"accumulator", 8},
      {"low-density-structure", 8},
      {"processing-unit", 3},
    },
    result = "ru-basic-accumulator",
  },
}
)

--end
