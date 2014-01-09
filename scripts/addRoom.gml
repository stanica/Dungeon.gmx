//Add room details to map
ds_list_add(rooms, ds_map_create());
var lastRoom = ds_list_find_value(rooms,ds_list_size(rooms)-1);
ds_map_add(lastRoom, "x1", argument0 - 1);
ds_map_add(lastRoom, "y1", argument1 - 1);
ds_map_add(lastRoom, "x2", argument0 + argument2 + 1);
ds_map_add(lastRoom, "y2", argument1 + argument3 + 1);
ds_map_add(lastRoom, "width", argument2);
ds_map_add(lastRoom, "height", argument3);
ds_map_add(lastRoom, "freeConnections", argument4);

for (var i = 0; i < 4; i++) {
    connections[i] = 0;
}
ds_map_add(lastRoom, "connections", connections);

//Add room shape to grid
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
