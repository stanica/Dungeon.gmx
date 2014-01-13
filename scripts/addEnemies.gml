for (var i = 0; i < 10; i++) {
    var ran = irandom(ds_list_size(rooms)-2) + 1
    var chosenRoom = ds_list_find_value(rooms, ran);
    var roomX = ds_map_find_value(chosenRoom, "x1");
    var roomY = ds_map_find_value(chosenRoom, "y1");
    var width = ds_map_find_value(chosenRoom, "width");
    var height = ds_map_find_value(chosenRoom, "height");
    var paddingX = irandom(width - 3) + 1;
    var paddingY = irandom(height - 3) + 1;
    var rat = instance_create((roomX + paddingX)* 32, (roomY + paddingY) * 32, obj_smallRat);
}
