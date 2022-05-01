--require("__base__/prototypes/entity/transport-belt-pictures")
require("prototypes.entity.logistic.belt.graphic.ru-medium-transport-belt")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
    {
    type = "transport-belt",
    name = "ru-medium-transport-belt",
    icons = {{icon = "__base__/graphics/icons/fast-transport-belt.png", tint = {r=202, g=154, b=152}}},
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "ru-medium-transport-belt"},
    max_health = 400,
    corpse = "transport-belt-remnants",
    dying_explosion = "transport-belt-explosion",
    related_underground_belt = "ru-medium-underground-belt",
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
        volume = 0.35
      },
      persistent = true
    },
    animation_speed_coefficient = 32,
    belt_animation_set = ru_medium_transport_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "ru-big-transport-belt",
    speed = 120 / 480,
    --0.25,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
    circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
})