local function shift_vector(v, dx, dy)
    return { v[1] + dx, v[2] + dy }
end

local function shift_circuit_connector(connector, dx, dy)
    for _, sprite in pairs(connector.sprites) do
        if type(sprite) == "table" and sprite.shift then
            sprite.shift = shift_vector(sprite.shift, dx, dy)
        end
    end

    if connector.sprites.blue_led_light_offset then
        connector.sprites.blue_led_light_offset =
            shift_vector(connector.sprites.blue_led_light_offset, dx, dy)
    end

    if connector.sprites.red_green_led_light_offset then
        connector.sprites.red_green_led_light_offset =
            shift_vector(connector.sprites.red_green_led_light_offset, dx, dy)
    end

    for _, group in pairs(connector.points) do
        for color, pos in pairs(group) do
            group[color] = shift_vector(pos, dx, dy)
        end
    end

    return connector
end

local circuit_connector = table.deepcopy(data.raw["roboport"]["roboport"].circuit_connector)
shift_circuit_connector(circuit_connector, -0.57, -0.45)

data:extend({
    {
        type                                         = "roboport",
        name                                         = "robotower",
        icon                                         = "__IndustrialRevolution3Assets1__/graphics/icons/64/robotower.png",
        icon_size                                    = 64,
        flags                                        = { "placeable-player", "player-creation" },
        minable                                      = {
            mining_time = 0.5,
            result = "robotower",
        },
        fast_replaceable_group                       = "roboport",
        max_health                                   = 500,
        corpse                                       = "roboport-remnants",
        collision_box                                = { { -0.95, -0.95 }, { 0.95, 0.95 } },
        selection_box                                = { { -1, -1 }, { 1, 1 } },
        resistances                                  = {
            {
                type = "fire",
                percent = 60,
            }, {
            type = "impact",
            percent = 30,
        }
        },
        dying_explosion                              = "medium-explosion",
        corpse                                       = "medium-small-remnants",
        damaged_trigger_effect                       = {
            {
                damage_type_filters = {
                    "fire",
                    "impact"
                },
                frame_speed = 1,
                frame_speed_deviation = 0.1,
                initial_height = 0.5,
                initial_vertical_speed = 0.07,
                initial_vertical_speed_deviation = 0.1,
                offset_deviation = {
                    { -0.5, -0.5 },
                    { 0.5,  0.5 }
                },
                particle_name = "copper-particle",
                probability = 0.2993813188471405,
                repeat_count = 1,
                speed_from_center = 0.02,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            {
                damage_type_filters = {
                    "fire",
                    "impact"
                },
                frame_speed = 1,
                frame_speed_deviation = 0.1,
                initial_height = 0.5,
                initial_vertical_speed = 0.07,
                initial_vertical_speed_deviation = 0.1,
                offset_deviation = {
                    { -0.5, -0.5 },
                    { 0.5,  0.5 }
                },
                particle_name = "glass-particle",
                probability = 0.09657461898294855,
                repeat_count = 1,
                speed_from_center = 0.02,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            {
                damage_type_filters = {
                    "fire",
                    "impact"
                },
                frame_speed = 1,
                frame_speed_deviation = 0.1,
                initial_height = 0.5,
                initial_vertical_speed = 0.07,
                initial_vertical_speed_deviation = 0.1,
                offset_deviation = {
                    { -0.5, -0.5 },
                    { 0.5,  0.5 }
                },
                particle_name = "gold-particle",
                probability = 0.064383079321965697,
                repeat_count = 1,
                speed_from_center = 0.02,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            {
                damage_type_filters = {
                    "fire",
                    "impact"
                },
                frame_speed = 1,
                frame_speed_deviation = 0.1,
                initial_height = 0.5,
                initial_vertical_speed = 0.07,
                initial_vertical_speed_deviation = 0.1,
                offset_deviation = {
                    { -0.5, -0.5 },
                    { 0.5,  0.5 }
                },
                particle_name = "iron-particle",
                probability = 0.19314923796589712,
                repeat_count = 1,
                speed_from_center = 0.02,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            {
                damage_type_filters = {
                    "fire",
                    "impact"
                },
                frame_speed = 1,
                frame_speed_deviation = 0.1,
                initial_height = 0.5,
                initial_vertical_speed = 0.07,
                initial_vertical_speed_deviation = 0.1,
                offset_deviation = {
                    { -0.5, -0.5 },
                    { 0.5,  0.5 }
                },
                particle_name = "steel-particle",
                probability = 0.25431316332176452,
                repeat_count = 1,
                speed_from_center = 0.02,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            }
        },
        energy_source                                = {
            input_flow_limit = "2MW",
            buffer_capacity = "25MJ",
            type = "electric",
            usage_priority = "secondary-input",
        },
        recharge_minimum                             = "1MJ",
        energy_usage                                 = "25kW",
        charging_energy                              = "500kW",
        logistics_radius                             = 25,
        construction_radius                          = 55,
        charge_approach_distance                     = 5,
        robot_slots_count                            = 3,
        material_slots_count                         = 3,
        stationing_offset                            = { 0, -0.7 },
        robots_shrink_when_entering_and_exiting      = true,
        charging_offsets                             = { { -0.85, -0.5 }, { 0.85, -0.5 } },
        draw_construction_radius_visualization       = true,
        draw_logistic_radius_visualization           = true,
        base                                         = {
            layers = {
                {
                    filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/robotower-base.png",
                    width = 128,
                    height = 192,
                    shift = { 0, -0.5 },
                    scale = 0.5,
                },
                {
                    filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/robotower-shadow.png",
                    width = 256,
                    height = 192,
                    shift = { 1, 0.5 },
                    draw_as_shadow = true,
                    scale = 0.5,
                }
            },
        },
        base_patch                                   = {
            filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/blank.png",
            width = 1,
            height = 1,
        },
        base_animation                               = {
            filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/robotower-lights.png",
            priority = "medium",
            width = 64,
            height = 96,
            frame_count = 16,
            animation_speed = 0.05,
            shift = { 0, 0.25 },
            scale = 0.5,
        },
        door_animation_up                            = {
            filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/robotower-door-down.png",
            priority = "medium",
            width = 96,
            height = 48,
            frame_count = 16,
            line_length = 16,
            shift = { 0, -0.625 },
            scale = 0.5,
        },
        door_animation_down                          = {
            filename = "__IndustrialRevolution3Assets3__/graphics/entities/machines/misc/robotower-door-up.png",
            priority = "medium",
            width = 96,
            height = 48,
            frame_count = 16,
            line_length = 16,
            shift = { 0, -1.375 },
            scale = 0.5,
        },
        recharging_animation                         = {
            animation_speed = 0.5,
            filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
            frame_count = 16,
            line_length = 16,
            height = 35,
            priority = "high",
            scale = 1.5,
            width = 37,
        },
        recharging_light                             = {
            color = { r = 0.75, g = 0.75, b = 1, a = 1 },
            intensity = 0.4,
            size = 5,
        },
        impact_category                              = "metal",
        open_sound                                   = {
            filename = "__base__/sound/open-close/roboport-open.ogg",
            volume = 0.5,
        },
        close_sound                                  = {
            filename = "__base__/sound/open-close/roboport-close.ogg",
            volume = 0.4,
        },
        working_sound                                = {
            sound = {
                filename = "__base__/sound/roboport-working.ogg",
                volume = 0.4,
            },
            max_sounds_per_type = 3,
            audible_distance_modifier = 0.75,
        },
        request_to_open_door_timeout                 = 15,
        spawn_and_station_height                     = 0.3,
        --stationing_render_layer_swap_height          = 0.87,
        stationing_render_layer_swap_height          = -1,
        open_door_trigger_effect                     = {
            {
                type = "play-sound",
                sound = {
                    category = "environment",
                    filename = "__base__/sound/roboport-door.ogg",
                    volume = 0.3,
                    min_speed = 1,
                    max_speed = 1.5,
                    aggregation = {
                        max_count = 1,
                        remove = true,
                    },
                },
            },
        },
        close_door_trigger_effect                    = {
            {
                type = "play-sound",
                sound = {
                    category = "environment",
                    filename = "__base__/sound/roboport-door-close.ogg",
                    volume = 0.2,
                    min_speed = 1,
                    max_speed = 1.5,
                    aggregation = {
                        max_count = 1,
                        remove = true,
                    },
                },
            },
        },
        circuit_connector                            = circuit_connector,
        circuit_wire_max_distance                    = 9,
        default_available_logistic_output_signal     = {
            type = "virtual",
            name = "signal-X",
        },
        default_total_logistic_output_signal         = {
            type = "virtual",
            name = "signal-Y",
        },
        default_available_construction_output_signal = {
            type = "virtual",
            name = "signal-Z",
        },
        default_total_construction_output_signal     = {
            type = "virtual",
            name = "signal-T",
        },
        vehicle_impact_sound                         = {
            game_controller_vibration_data = {
                duration = 150,
                low_frequency_vibration_intensity = 0.9
            },
            switch_vibration_data = {
                filename = "__base__/sound/car-metal-impact.bnvib"
            },
            variations = {
                {
                    filename = "__base__/sound/car-metal-impact-2.ogg",
                    volume = 0.5
                },
                {
                    filename = "__base__/sound/car-metal-impact-3.ogg",
                    volume = 0.5
                },
                {
                    filename = "__base__/sound/car-metal-impact-4.ogg",
                    volume = 0.5
                },
                {
                    filename = "__base__/sound/car-metal-impact-5.ogg",
                    volume = 0.5
                },
                {
                    filename = "__base__/sound/car-metal-impact-6.ogg",
                    volume = 0.5
                }
            }
        },
        water_reflection                             = {
            orientation_to_variation = false,
            pictures = {
                filename = "__base__/graphics/entity/roboport/roboport-reflection.png",
                height = 28,
                priority = "extra-high",
                scale = 3,
                shift = { 0, 2.34375 },
                variation_count = 1,
                width = 28
            },
            rotate = false
        }
    }
})
