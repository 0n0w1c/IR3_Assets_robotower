local item_sounds = require("__base__/prototypes/entity/sounds")

data:extend({
    {
        type = "item",
        name = "robotower",

        icon = "__IndustrialRevolution3Assets1__/graphics/icons/64/robotower.png",
        subgroup = "logistic-network",
        order = "c[signal]-a[robotower]",
        inventory_move_sound = item_sounds.roboport_inventory_move,
        pick_sound = item_sounds.roboport_inventory_pickup,
        drop_sound = item_sounds.roboport_inventory_move,
        place_result = "robotower",
        stack_size = 10,
        weight = 50 * kg,
        minable = { mining_time = 0.1, result = "robotower" }
    }
})
