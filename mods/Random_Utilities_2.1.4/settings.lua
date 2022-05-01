local selectable_armors = {"Nothing", "Modular armor", "Power armor", "Power armor MK2"}

-- Power Armor MK3
if mods["Power Armor MK3"] then
    table.insert(selectable_armors, "Power armor MK3")
    table.insert(selectable_armors, "Power armor MK4")
end

data:extend({
  --boiler OK
  {
    type = "string-setting",
    name = "ru-boiler",
    order = "aa",
    setting_type = "startup",
    default_value = "big",
    allowed_values =
    {
      "nothing",
      "basic",
      "medium",
      "big",
      "behemoth"
    },
  },
  --Steam Engine OK
  {
    type = "string-setting",
    name = "ru-steam-engine",
    order = "ab",
    setting_type = "startup",
    default_value = "big",
    allowed_values =
    {
      "nothing",
      "basic",
      "medium",
      "big",
      "behemoth"
    },
  },
  --Solar panel OK
  {
    type = "string-setting",
    name = "ru-solar-panel",
    order = "ag",
    setting_type = "startup",
    default_value = "big",
    allowed_values =
    {
      "nothing",
      "basic",
      "medium",
      "big",
      "behemoth"
    },
  },
  --accumulator OK
  {
    type = "string-setting",
    name = "ru-accumulator",
    order = "ah",
    setting_type = "startup",
    default_value = "big",
    allowed_values =
    {
      "nothing",
      "basic",
      "medium",
      "big",
      "behemoth"
    },
  },
  --substation OK
  {
    type = "string-setting",
    name = "ru-substation",
    order = "ai",
    setting_type = "startup",
    default_value = "big",
    allowed_values =
    {
      "nothing",
      "basic",
      "medium",
      "big",
      "behemoth"
    },
  },
  --lamp OK
  {
    type = "string-setting",
    name = "ru-lamp",
    order = "aj",
    setting_type = "startup",
    default_value = "big",
    allowed_values =
    {
      "nothing",
      "basic",
      "medium",
      "big",
--      "behemoth"
    },
  },
  --beacon OK
  {
    type = "string-setting",
    name = "ru-beacon",
    order = "al",
    setting_type = "startup",
    default_value = "big",
    allowed_values =
    {
      "nothing",
      "basic",
      "medium",
      "big",
--      "behemoth"
    },
  },
  --walkable beacon OK
  {
    type = "string-setting",
    name = "ru-walkable-beacon",
    order = "am",
    setting_type = "startup",
    default_value = "big",
    allowed_values =
    {
      "nothing",
      "basic",
      "medium",
      "big",
--      "behemoth"
    },
  },    
  --logistic = belt/splitter/underground OK
  {
    type = "string-setting",
    name = "ru-Logistic",
    order = "ana",
    setting_type = "startup",
    default_value = "big",
    allowed_values =
    {
      "nothing",
      "basic",
      "medium",
      "big",
      "behemoth"
    },
  },
  --fluid handling = pump/pipe/pipe to ground/storage tank OK
  {
    type = "string-setting",
    name = "ru-fluid-handling",
    order = "anb",
    setting_type = "startup",
    default_value = "big",
    allowed_values =
    {
      "nothing",
      "basic",
      "medium",
      "big",
      "behemoth"
    },
  },
  --inserter OK
  {
  type = "string-setting",
  name = "ru-inserter",
  order = "ao",
  setting_type = "startup",
  default_value = "big",
  allowed_values =
    {
      "nothing",
      "basic",
      "medium",
      "big",
      "behemoth"
    },
  },
  --Infinite Repairer OK
  {
    type = "bool-setting",
    name = "ru-Infinite-Repairer",
    order = "as",
    setting_type = "startup",
    default_value = "true",
  },

  --beacon Productivity
  {
    type = "bool-setting",
    name = "ru-beacon-Productivity",
    order = "ba",
    setting_type = "startup",
    default_value = "true",
  },
  --beacon Productivity
  {
    type = "bool-setting",
    name = "ru-Disable-Productivity-Limitation",
    order = "bb",
    setting_type = "startup",
    default_value = "true",
  },
  --behemoth logistics tweaks
  {
    type = "string-setting",
    name = "ru-behemoth-logistics-tweaks",
    order = "bc",
    setting_type = "startup",
    default_value = "360",
    allowed_values =
    {
      "360",
      "640",
      "1280",
    },
  },


  --Inventory size OK
  {
    type = "int-setting",
    name = "ru-inventory-size",
    order = "ca",
    setting_type = "startup",
    default_value = 80,
    minimum_value = 20,
    maximum_value = 2000,
  },
  --stack size multiplier OK
  {
    type = "double-setting",
    name = "ru-stack-Size",
    order = "cb",
    setting_type = "startup",
    default_value = 10,
    minimum_value = 1,
    maximum_value = 2147483647,
  },
  --enable stack size Contruction Robot OK
  {
    type = "bool-setting",
    name = "ru-stack-Size-CRobot",
    order = "cc",
    setting_type = "startup",
    default_value = "true",
  },
  --enable stack size Logistic Robot OK
  {
    type = "bool-setting",
    name = "ru-stack-Size-LRobot",
    order = "cd",
    setting_type = "startup",
    default_value = "true",
  },
  --reach distance OK
  {
    type = "int-setting",
    name = "ru-reach-distance",
    order = "ce",
    setting_type = "startup",
    default_value = 6,
    minimum_value = 1,
    maximum_value = 100000,
  },
  --Mining reach OK
  {
    type = "int-setting",
    name = "ru-mine-reach",
    order = "cf",
    setting_type = "startup",
    default_value = 6,
    minimum_value = 1,
    maximum_value = 100000,
  },
  --Mining speed OK
  {
    type = "double-setting",
    name = "ru-mining-speed",
    order = "cg",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0.01,
    maximum_value = 1000,
  },
  --hp OK
  {
    type = "int-setting",
    name = "ru-hp",
    order = "ch",
    setting_type = "startup",
    default_value = 250,
    minimum_value = 1,
    maximum_value = 250000,
  },
  --hp recovery OK
  {
    type = "double-setting",
    name = "ru-hp-recovery",
    order = "cia",
    setting_type = "startup",
    default_value = 0.15,
    minimum_value = 0.1,
    maximum_value = 1500,
  },
  --running speed
  {
    type = "double-setting",
    name = "ru-running-speed",
    order = "cib",
    setting_type = "startup",
    default_value = 0,
    minimum_value = -100,
    maximum_value = 100,
  },
  --bot speed OK
  {
    type = "double-setting",
    name = "ru-botspeed",
    order = "cj",
    setting_type = "startup",
    default_value = 0,
    minimum_value = 0,
    maximum_value = 1,
  },
  --No Crafting Time OK
  {
    type = "bool-setting",
    name = "ru-No-Crafting-Time",
    order = "ck",
    setting_type = "startup",
    default_value = "false",
  },
  --RU Better Cable Visibility OK
  {
    type = "bool-setting",
    name = "ru-Better-Cable-Visibility",
    order = "cl",
    setting_type = "startup",
    default_value = "true",
  },
  --Enable wire Shortcuts OK
  {
    type = "bool-setting",
    name = "ru-Enable-Wire-Shortcuts",
    order = "cm",
    setting_type = "startup",
    default_value = "true",
  },
  --mantain Wire crafting OK
  {
    type = "bool-setting",
    name = "ru-wire-shortcuts-is-retain-wire-crafting",
    order = "cna",
    setting_type = "startup",
    default_value = false,
  },
  --mantain Wire cutter OK
  {
    type = "bool-setting",
    name = "ru-wire-shortcuts-is-advanced-cutter",
    order = "cnb",
    setting_type = "runtime-per-user",
    default_value = false,
  },
  --alternativerecipe DISABLED NO
  {
    type = "bool-setting",
    name = "ru-alternativerecipe",
    hidden = "true",
    order = "co",
    setting_type = "startup",
    default_value = "false",
  },
  --cheatyrecipe DISABLED NO
  {
    type = "bool-setting",
    name = "ru-cheatyrecipe",
    hidden = "true",
    order = "cp",
    setting_type = "startup",
    default_value = "false",
  },
  --ru-Machine-liquid-Imput-Output OK
  {
    type = "bool-setting",
    name = "ru-Machine-liquid-Imput-Output",
    order = "cq",
    setting_type = "startup",
    default_value = "false",
  },
  --ru-Assembling-Machine-Imput-Output OK
  {
    type = "bool-setting",
    name = "ru-Assembling-Machine-Imput-Output",
    order = "cr",
    setting_type = "startup",
    default_value = "true",
  },
  --ru-Chemical-Plant-Imput-Output OK
  {
    type = "bool-setting",
    name = "ru-Chemical-Plant-Imput-Output",
    order = "cs",
    setting_type = "startup",
    default_value = "true",
  },
  --ru-Oil-Refineries-Imput-Output OK
  {
    type = "bool-setting",
    name = "ru-Oil-Refineries-Imput-Output",
    order = "ct",
    setting_type = "startup",
    default_value = "true",
  },
  --ru-MiniEquipment OK
  {
    type = "bool-setting",
    name = "ru-MiniEquipment",
    order = "cu",
    setting_type = "startup",
    default_value = "true",
  },
  --ru-force-chemical-fuel
  {
  type = "bool-setting",
  name = "ru-force-chemical-fuel",
  order = "cv",
  setting_type = "startup",
  default_value = "true",
  },
  --ru-force-equipment-categories
  {
    type = "bool-setting",
    name = "ru-force-equipment-categories",
    order = "cu",
    setting_type = "startup",
    default_value = "true",
  },

  --small electric pole wire reach OK
  {
    type = "double-setting",
    name = "small-electric-pole-max-wire-distance",
    order = "da",
    setting_type = "startup",
    maximum_value = 64,
    default_value = 7.5,
    minimum_value = 2.5,
  },
  --small electric pole supply area OK
  {
    type = "double-setting",
    name = "small-electric-pole-supply-area-distance",
    order = "db",
    setting_type = "startup",
    maximum_value = 128,
    default_value = 5,
    minimum_value = 3,
  },
  --medium electric pole wire reach OK
  {
    type = "double-setting",
    name = "medium-electric-pole-max-wire-distance",
    order = "dc",
    setting_type = "startup",
    maximum_value = 64,
    default_value = 9,
    minimum_value = 2.5,
  },
  --medium electric pole supply area OK
  {
    type = "double-setting",
    name = "medium-electric-pole-supply-area-distance",
    order = "dd",
    setting_type = "startup",
    maximum_value = 128,
    default_value = 7,
    minimum_value = 3,
  },
  --big electric pole wire reach OK
  {
    type = "double-setting",
    name = "big-electric-pole-max-wire-distance",
    order = "de",
    setting_type = "startup",
    maximum_value = 64,
    default_value = 30,
    minimum_value = 3,
  },
  --big electric pole supply area OK
  {
    type = "double-setting",
    name = "big-electric-pole-supply-area-distance",
    order = "df",
    setting_type = "startup",
    maximum_value = 128,
    default_value = 4,
    minimum_value = 4,
  },
  --vanilla substation wire reach OK
  {
    type = "double-setting",
    name = "substation-max-wire-distance",
    order = "dg",
    setting_type = "startup",
    maximum_value = 64,
    default_value = 18,
    minimum_value = 3,
  },
  --vanilla substation supply area OK
  {
    type = "double-setting",
    name = "substation-supply-area-distance",
    order = "dh",
    setting_type = "startup",
    maximum_value = 128,
    default_value = 18,
    minimum_value = 4,
  },

  --Quick Start OK
  {
    type = "string-setting",
    name = "ru-quick-start",
    order = "ea",
    setting_type = "startup",
    default_value = "Nothing",
    allowed_values = 
    {
      "Nothing", 
      "Basic", 
      "Medium", 
      "Big", 
      "Huge",
      "Behemoth"
    },
  },
  --Quick Start Armor OK
  {
    type = "string-setting",
    name = "ru-armor-quick-start",
    order = "eb",
    setting_type = "startup",
    default_value = "Nothing",
    allowed_values = selectable_armors,
  },
  --Quick Start spidertron OK
  {
    type = "bool-setting",
    name = "ru-quick-start-spidetron",
    order = "ec",
    setting_type = "startup",
    default_value = "false",
  },
  --Quick Start Train technology OK
  {
    type = "bool-setting",
    name = "ru-train-technology",
    order = "ed",
    setting_type = "startup",
    default_value = "false",
  },
  --Quick Start Robot technology OK
  {
    type = "bool-setting",
    name = "ru-robot-technology",
    order = "ee",
    setting_type = "startup",
    default_value = "false",
  },

  --space exploration integration OK
  {
    type = "bool-setting",
    name = "ru-space-exploration-integrations",
    hidden = "true",
    order = "fa",
    setting_type = "startup",
    default_value = "true",
  },
  --angel integration OK
  {
    type = "bool-setting",
    name = "ru-angel-integrations",
    hidden = "true",
    order = "fb",
    setting_type = "startup",
    default_value = "true",
  },
  --bob integration OK
  {
    type = "bool-setting",
    name = "ru-bob-integrations",
    hidden = "true",
    order = "fc",
    setting_type = "startup",
    default_value = "true",
  },
  --krastorio2 integration OK
  {
    type = "bool-setting",
    name = "ru-krastorio2-integrations",
    hidden = "true",
    order = "fd",
    setting_type = "startup",
    default_value = "true",
  },
  --LiquifyScienceandLab integration OK
  {
    type = "bool-setting",
    name = "ru-LiquifyScienceandLab-integrations",
    hidden = "true",
    order = "fe",
    setting_type = "startup",
    default_value = "true",
  },

  --angel warehouse OK
  {
    type = "int-setting",
    name = "ru-angels-warehouse",
    hidden = "true",
    order = "gaa",
    setting_type = "startup",
    default_value = 1800,
    minimum_value = 1,
    maximum_value = 65535,
  },
  --angel logistic warehouse OK
  {
    type = "int-setting",
    name = "ru-angels-logistic-warehouse",
    hidden = "true",
    order = "gab",
    setting_type = "startup",
    default_value = 1800,
    minimum_value = 1,
    maximum_value = 65535,
  },
  --angel warehouse OK
  {
    type = "int-setting",
    name = "ru-angels-silo",
    hidden = "true",
    order = "gba",
    setting_type = "startup",
    default_value = 200,
    minimum_value = 1,
    maximum_value = 65535,
  },
  --angel logistic warehouse OK
  {
    type = "int-setting",
    name = "ru-angels-logistic-silo",
    hidden = "true",
    order = "gbb",
    setting_type = "startup",
    default_value = 200,
    minimum_value = 1,
    maximum_value = 65535,
  },
  --krastorio2 medium container OK
  {
    type = "int-setting",
    name = "ru-Krastorio2-medium-container",
    hidden = "true",
    order = "gc",
    setting_type = "startup",
    default_value = 400,
    minimum_value = 1,
    maximum_value = 10000,
  },
  --krastorio2 medium logistic container OK
  {
    type = "int-setting",
    name = "ru-Krastorio2-medium-logistic-container",
    hidden = "true",
    order = "gd",
    setting_type = "startup",
    default_value = 400,
    minimum_value = 1,
    maximum_value = 10000,
  },
  --krastorio2 big container OK
  {
    type = "int-setting",
    name = "ru-Krastorio2-big-container",
    hidden = "true",
    order = "ge",
    setting_type = "startup",
    default_value = 1800,
    minimum_value = 1,
    maximum_value = 65535,
  },
  --krastorio2 big logistic container OK
  {
    type = "int-setting",
    name = "ru-Krastorio2-big-logistic-container",
    hidden = "true",
    order = "gf",
    setting_type = "startup",
    default_value = 1800,
    minimum_value = 1,
    maximum_value = 65535,
  },
  --Juicy Mods big generic chest OK
  {
    type = "int-setting",
    name = "ru-juicy-mods-big-generic-chest",
    hidden = "true",
    order = "gg",
    setting_type = "startup",
    default_value = 400,
    minimum_value = 1,
    maximum_value = 10000,
  },
  --Juicy Mods big logistic chest OK
  {
    type = "int-setting",
    name = "ru-juicy-mods-big-logistic-chest",
    hidden = "true",
    order = "gh",
    setting_type = "startup",
    default_value = 400,
    minimum_value = 1,
    maximum_value = 10000,
  },
  --Juicy Mods generic warehoude OK
  {
    type = "int-setting",
    name = "ru-juicy-mods-generic-warehoude",
    hidden = "true",
    order = "gi",
    setting_type = "startup",
    default_value = 2000,
    minimum_value = 1,
    maximum_value = 65535,
  },
  --Juicy Mods logistic warehoude OK
  {
    type = "int-setting",
    name = "ru-juicy-mods-logistic-warehoude",
    hidden = "true",
    order = "gj",
    setting_type = "startup",
    default_value = 2000,
    minimum_value = 1,
    maximum_value = 65535,
  },

  --angel pressuretank OK
  {
    type = "int-setting",
    name = "ru-angels-pressuretank",
    hidden = "true",
    order = "haa",
    setting_type = "startup",
    default_value = 100000,
    minimum_value = 1,
    maximum_value = 100000000,
  },
  --angel pressuretank OK
  {
    type = "int-setting",
    name = "ru-angels-storage-tank-3",
    hidden = "true",
    order = "hab",
    setting_type = "startup",
    default_value = 100000,
    minimum_value = 1,
    maximum_value = 100000000,
  },
  --Krastorio2 big fluid storage OK
  {
    type = "int-setting",
    name = "ru-kr-fluid-storage-1",
    hidden = "true",
    order = "hb",
    setting_type = "startup",
    default_value = 1000,
    minimum_value = 1,
    maximum_value = 100000000,
  },
  --Krastorio2 huge fluid storage OK
  {
    type = "int-setting",
    name = "ru-kr-fluid-storage-2",
    hidden = "true",
    order = "hc",
    setting_type = "startup",
    default_value = 100000,
    minimum_value = 1,
    maximum_value = 100000000,
  },
})