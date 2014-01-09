for (var k = 0; k < argument3; k++) {
    for (var l = 0; l < argument2; l++) {
        if (k == 0) {
            ds_map_replace(ds_grid_get(dungeon, argument0+l, argument1+k), "blockType",1);
        }
        else if (k == argument3-1) {
            ds_map_replace(ds_grid_get(dungeon, argument0+l, argument1+k), "blockType", 1);
        }
        else if (l == 0) {
            ds_map_replace(ds_grid_get(dungeon, argument0+l, argument1+k), "blockType", 1);
        }
        else if (l == argument2-1) {
            ds_map_replace(ds_grid_get(dungeon, argument0+l, argument1+k), "blockType", 1);
        }
        else 
            ds_map_replace(ds_grid_get(dungeon, argument0+l, argument1+k), "blockType", 2); 
    }
}
