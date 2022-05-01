--if settings.startup["ru-accumulator"].value == true then

--item
data:extend(
{
  {
    type = "item",
    name = "ru-behemoth-accumulator",
    icons = {{icon = "__base__/graphics/icons/accumulator.png", tint = {r=80, g=80, b=80}}},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-accumulator",
    order = "d",
    place_result = "ru-behemoth-accumulator",
    stack_size = 50
  },
}
)

--end
