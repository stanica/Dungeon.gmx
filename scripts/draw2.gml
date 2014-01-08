for (var i = 0; i < argument1; i++) {
    for (var j = 0; j < argument0; j++) {
        var blockType = ds_grid_get(dungeon, j, i);
        if (ds_grid_get(dungeonIds, j, i) != 0) {
            var blockId = instance_nearest(j * 32, i * 32, obj_black);
            with (blockId) {
                instance_destroy();
            }
        }
    }
}

