--if settings.startup["ru-accumulator"].value == true then

--item
data:extend(
{
  {
    type = "item",
    name = "ru-medium-accumulator",
    icons = {{icon = "__base__/graphics/icons/accumulator.png", tint = {r=202, g=154, b=152}}},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-accumulator",
    order = "b",
    place_result = "ru-medium-accumulator",
    stack_size = 50
  },
}
)

--end
