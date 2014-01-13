for (var i = argument1 - argument2; i < argument1 + argument2; i++) {
    for (var j = argument0 - argument2; j < argument0 + argument2; j++) {
        instance_activate_object(ds_grid_get(dungeonIds, j, i));
    }
}
