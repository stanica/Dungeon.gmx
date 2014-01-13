var obj;
for (var i = 0; i < argument1; i++) {
    for (var j = 0; j < argument0; j++) {
        var blockId = ds_grid_get(dungeonBlocksIds, j, i);
        with (blockId) {
            instance_destroy();
        }
    }
}

for (var i = 0; i < argument1; i++) {
    for (var j = 0; j < argument0; j++) {
        var blockType = ds_map_find_value(ds_grid_get(dungeonBlocks, j, i), "blockType")
        if (blockType == 0) 
            obj = obj_black;
        else if (blockType == 1)
            obj = obj_wall;
        else if (blockType == 2)
            obj = obj_inner;     
        ds_grid_set(dungeonBlocksIds, j, i, instance_create(j * 32, i * 32, obj));
    }
}
