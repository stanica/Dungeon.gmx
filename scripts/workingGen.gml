//Initial setup
randomize();
var sprite_size = 32;
var roomNumber = 2;
var currentRoom = 0;
globalvar totalRooms;
totalRooms = 0;

var height = room_height / sprite_size;
var width = room_width / sprite_size;

init(width, height);

var minRoomSize = 2;
var maxRoomSize = 5;

//Room generation
var roomW = minRoomSize + irandom(maxRoomSize - minRoomSize + 1);
var roomH = minRoomSize + irandom(maxRoomSize - minRoomSize + 1);
var j = irandom(width - roomW - 1) + 1;
var i = irandom(height - roomH - 1) + 1;

addRoom(j, i, roomW, roomH);

show_message("["+string(width)+"x" +string(height) +"]"+" "+string(j) + "," + string(i) + " " +string(j + roomW-1)+ " " + string(i+roomH-1));
var failed = false;
while(currentRoom < roomNumber) {
    if (ds_map_find_value(ds_grid_get(dungeon, j, i), "blockType") == 0) {
        for (var k = 0; k < roomH; k++) {
            for (var l = 0; l < roomW; l++) {
                if (ds_map_find_value(ds_grid_get(dungeon, j+l, i+k), "blockType") != 0) {
                    failed = true;
                }
            }
        }
        if (!failed) {
            for (var k = 0; k < roomH; k++) {
                for (var l = 0; l < roomW; l++) {
                    ds_map_replace(ds_grid_get(dungeon, j+l, i+k), "blockType", 1); 
               }
            }
            currentRoom++; 
            failed = false;
        }
    }
    else {
        roomW = minRoomSize + irandom(maxRoomSize - minRoomSize + 1);
        roomH = minRoomSize + irandom(maxRoomSize - minRoomSize + 1);
        j = irandom(width - roomW - 1) + 1;
        i = irandom(height - roomH - 1) + 1;
        show_message("["+string(width)+"x" +string(height) +"]"+" "+string(j) + "," + string(i) + " " +string(j+roomW-1)+ " " + string(i+roomH-1));
    }
    draw(width, height);
}



