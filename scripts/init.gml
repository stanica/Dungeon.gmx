dungeon = ds_grid_create(argument0, argument1);
dungeonIds = ds_grid_create(argument0, argument1);
rooms = ds_list_create();

for (var i = 0; i < argument1; i++) {
    for (var j = 0; j < argument0; j++) {
        ds_grid_set(dungeon, j, i, ds_map_create());
        ds_map_add(ds_grid_get(dungeon, j, i), "blockType", 0);
    }
}

instance_create(room_width / 2, room_height / 2, obj_player);
