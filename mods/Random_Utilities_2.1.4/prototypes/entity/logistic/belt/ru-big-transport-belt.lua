--require("__base__/prototypes/entity/transport-belt-pictures")
require("prototypes.entity.logistic.belt.graphic.ru-big-transport-belt")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
    {
    type = "transport-belt",
    name = "ru-big-transport-belt",
    icons = {{icon = "__base__/graphics/icons/express-transport-belt.png", tint = {r=132, g=180, b=181}}},
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "ru-big-transport-belt"},
    max_health = 500,
    corpse = "transport-belt-remnants",
    dying_explosion = "transport-belt-explosion",
    related_underground_belt = "ru-big-underground-belt",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/transport-belt.ogg",
        volume = 0.4
      },
      persistent = true
    },
    animation_speed_coefficient = 32,
    belt_animation_set = ru_big_transport_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "ru-behemoth-transport-belt",
    speed = 180 / 480,
    --0.3125,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
    circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
})