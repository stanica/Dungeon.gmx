var obj;
for (var i = 0; i < argument1; i++) {
    for (var j = 0; j < argument0; j++) {
        var blockId = ds_grid_get(dungeonIds, j, i);
        with (blockId) {
            instance_destroy();
        }
    }
}

for (var i = 0; i < argument1; i++) {
    for (var j = 0; j < argument0; j++) {
        var blockType = ds_map_find_value(ds_grid_get(dungeon, j, i), "blockType")
        if (blockType == 0) 
            obj = obj_black;
        else if (blockType == 1)
            obj = obj_wall;
        else if (blockType == 2)
            obj = obj_inner;
        else if (blockType == 3)
            obj = obj_other;
        else if (blockType == 4)
            obj = obj_other2; 
        else if (blockType == 5)
            obj = obj_other3;      
        ds_grid_set(dungeonIds, j, i, instance_create(j * 32, i * 32, obj));
    }
}
