//Stores blockType for each location on the map
dungeonBlocks = ds_grid_create(argument0, argument1);

//Stores the objects of the blockType instances. 
dungeonBlocksIds = ds_grid_create(argument0, argument1);

//Stores a list of rooms. A room is a ds_map with various properties.
rooms = ds_list_create();

for (var i = 0; i < argument1; i++) {
    for (var j = 0; j < argument0; j++) {
        ds_grid_set(dungeonBlocks, j, i, ds_map_create());
        //ds_map_add(ds_grid_get(dungeonBlocks, j, i), "blockType", 0);
    }
}

instance_create(room_width / 2, room_height / 2, obj_player);
