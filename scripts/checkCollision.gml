var gridInfo, blockType; 
for (var i = 0; i < argument3; i++) {
    for (var j = 0; j < argument2; j++) {
        gridInfo = ds_grid_get(dungeonBlocks, argument0 + j, argument1 + i);
        blockType = ds_map_find_value(gridInfo, "blockType");
        if (blockType != 0)
            return true;
    }
}
return false;
