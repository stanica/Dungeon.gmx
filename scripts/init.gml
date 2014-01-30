//Stores blockType for each location on the map
dungeonBlocks = ds_grid_create(argument0, argument1);

//Stores the objects of the blockType instances. 
dungeonBlocksIds = ds_grid_create(argument0, argument1);

initEnemies();

//Stores a list of rooms. A room is a ds_map with various properties.
rooms = ds_list_create();

for (var i = 0; i < argument1; i++) {
    for (var j = 0; j < argument0; j++) {
        ds_grid_set(dungeonBlocks, j, i, ds_map_create());
        //ds_map_add(ds_grid_get(dungeonBlocks, j, i), "blockType", 0);
    }
}

var yPos = ceil((ceil(room_height / spriteSize)) / 2);
var xPos = ceil((ceil(room_width / spriteSize)) / 2);

instance_create(xPos*32, yPos*32, obj_player);
