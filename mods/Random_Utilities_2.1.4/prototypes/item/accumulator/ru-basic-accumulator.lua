--if settings.startup["ru-accumulator"].value == true then

--item
data:extend(
{
  {
    type = "item",
    name = "ru-basic-accumulator",
    icons = {{icon = "__base__/graphics/icons/accumulator.png", tint = {r=178, g=173, b=100}}},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-accumulator",
    order = "a",
    place_result = "ru-basic-accumulator",
    stack_size = 50
  },
}
)

--end
