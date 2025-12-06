local item_sounds = require("__base__/prototypes/entity/sounds")

data:extend({
    {
        type = "recipe",
        name = "robotower",
        enabled = false,
        ingredients =
        {
            { type = "item", name = "steel-plate",      amount = 25 },
            { type = "item", name = "copper-cable",     amount = 25 },
            { type = "item", name = "advanced-circuit", amount = 25 }
        },
        results = { { type = "item", name = "robotower", amount = 1 } },
        energy_required = 10,
    }
})

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
        minable = {
            mining_time = 0.1,
            result = "robotower"
        },
    },
})

data:extend({
    {
        type = "roboport",
        name = "robotower",
        icon = "__IndustrialRevolution3Assets1__/graphics/icons/64/robotower.png",
        icon_size = 64,
        flags = { "placeable-player", "player-creation" },
        minable = {
            mining_time = 0.5,
            result = "robotower",
        },
        fast_replaceable_group = "roboport",
        max_health = 500,
        corpse = "roboport-remnants",
        collision_box = { { -0.95, -0.95 }, { 0.95, 0.95 } },
        selection_box = { { -1, -1 }, { 1, 1 } },
        resistances = {
            {
                type = "fire",
                percent = 60,
            }, {
            type = "impact",
            percent = 30,
        }
        },
        dying_explosion = "medium-explosion",
        energy_source = {
            input_flow_limit = "2MW",
            buffer_capacity = "25MJ",
            type = "electric",
            usage_priority = "secondary-input",
        },
        recharge_minimum = "1MJ",
        energy_usage = "25kW",
        -- per one charge slot
        charging_energy = "500kW",
        logistics_radius = 25,
        construction_radius = 55,
        charge_approach_distance = 4,
        robot_slots_count = 3,
        material_slots_count = 3,
        stationing_offset = { 0, -0.5 },
        robots_shrink_when_entering_and_exiting = true,
        charging_offsets = { { -0.85, -0.5 }, { 0.85, -0.5 } },
        base = {
            layers = { {
                filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/robotower-base.png",
                width = 128,
                height = 192,
                shift = { 0, -0.5 },
                scale = 0.5,
            }, {
                filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/robotower-shadow.png",
                width = 256,
                height = 192,
                shift = { 1, 0.5 },
                draw_as_shadow = true,
                scale = 0.5,
            } },
        },
        base_patch = {
            filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/blank.png",
            width = 1,
            height = 1,
        },
        base_animation = {
            filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/robotower-lights.png",
            priority = "medium",
            width = 64,
            height = 96,
            frame_count = 16,
            animation_speed = 0.05,
            shift = { 0, 0.25 },
            scale = 0.5,
        },
        door_animation_up = {
            filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/robotower-door-down.png",
            priority = "medium",
            width = 96,
            height = 48,
            frame_count = 16,
            line_length = 16,
            shift = { 0, -0.625 },
            scale = 0.5,
        },
        door_animation_down = {
            filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/robotower-door-up.png",
            priority = "medium",
            width = 96,
            height = 48,
            frame_count = 16,
            line_length = 16,
            shift = { 0, -1.375 },
            scale = 0.5,
        },
        recharging_animation = {
            animation_speed = 0.5,
            filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
            frame_count = 16,
            line_length = 16,
            height = 35,
            priority = "high",
            scale = 1.5,
            width = 37,
        },
        recharging_light = {
            color = { r = 0.75, g = 0.75, b = 1, a = 1 },
            intensity = 0.4,
            size = 5,
        },
        vehicle_impact_sound = item_sounds.generic_impact,
        open_sound = item_sounds.machine_open,
        close_sound = item_sounds.machine_close,
        working_sound = {
            sound = {
                filename = "__base__/sound/roboport-working.ogg",
                volume = 0.4,
            },
            max_sounds_per_type = 3,
            audible_distance_modifier = 0.75,
        },
        request_to_open_door_timeout = 15,
        spawn_and_station_height = 0.5,
        open_door_trigger_effect = item_sounds.roboport_door_open,
        close_door_trigger_effect = item_sounds.roboport_door_close,
        circuit_wire_connection_point = circuit_connector_definitions["roboport"].points,
        circuit_connector_sprites = circuit_connector_definitions["roboport"].sprites,
        circuit_wire_max_distance = 10,
        default_available_logistic_output_signal = {
            type = "virtual",
            name = "signal-X",
        },
        default_total_logistic_output_signal = {
            type = "virtual",
            name = "signal-Y",
        },
        default_available_construction_output_signal = {
            type = "virtual",
            name = "signal-Z",
        },
        default_total_construction_output_signal = {
            type = "virtual",
            name = "signal-T",
        }
    }
})
