--if settings.startup["ru-accumulator"].value == true then

--item
data:extend(
{
  {
    type = "item",
    name = "ru-big-accumulator",
    icons = {{icon = "__base__/graphics/icons/accumulator.png", tint = {r=132, g=180, b=181}}},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-accumulator",
    order = "c",
    place_result = "ru-big-accumulator",
    stack_size = 50
  },
}
)

--end
