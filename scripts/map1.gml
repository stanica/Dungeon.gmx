var totalRoomNumber = 22;

var minRoomSize = 7;
var maxRoomSize = 9;

var roomCheck = 0;
var collide = false;
var currRoom, x1, x2, y1, y2, spacing, numCollisions = 0, freeConnections, 
    maxConnections, door, connectionAttempt=0, connections;

//Initial room at center of map with 3 potential connections
roomW = minRoomSize + irandom(maxRoomSize - minRoomSize + 1);
roomH = minRoomSize + irandom(maxRoomSize - minRoomSize + 1);
var j = floor(argument0 / 2 - roomW / 2);
var i = floor(argument1 / 2 - roomH / 2);
addRoom(j, i, roomW, roomH, 3); 
roomW = minRoomSize + irandom(maxRoomSize - minRoomSize + 1);
roomH = minRoomSize + irandom(maxRoomSize - minRoomSize + 1);

while(ds_list_size(rooms) < totalRoomNumber) { 
        roomCheck = irandom(ds_list_size(rooms)-1);
        currRoom = ds_list_find_value(rooms, roomCheck)
        freeConnections = ds_map_find_value(currRoom, "freeConnections");
        connections = ds_map_find_value(currRoom,"connections");
        if (freeConnections == 0) {
            roomCheck = irandom(ds_list_size(rooms)-1);
        }
        else {
            x1 = ds_map_find_value(currRoom, "x1");
            y1 = ds_map_find_value(currRoom, "y1");
            x2 = ds_map_find_value(currRoom, "x2");
            y2 = ds_map_find_value(currRoom, "y2");
            tempH = ds_map_find_value(currRoom, "height");
            tempW = ds_map_find_value(currRoom, "width");
            connectionAttempt = 0;
            
            while(connectionAttempt < freeConnections) {
                door = choose(0, 1, 2, 3);
                maxConnections = 4;
                var corridorLength = 2;
                if (door == 0 && connections[door] == 0 && (y1 - roomH - corridorLength) > 0) {
                    if (!checkCollision(floor(x1 + (tempW / 2) - (roomW / 2)),floor(y1 - roomH - corridorLength), roomW, roomH)) {
                        addRoom(floor(x1 + (tempW / 2) - (roomW / 2)),floor(y1 - roomH - corridorLength), roomW, roomH, maxConnections);
                        for (var k = 0; k < corridorLength+2; k++) {
                            ds_map_replace(ds_grid_get(dungeonBlocks, floor(x1 + (tempW / 2)), y1-k), "blockType", 2);
                            ds_map_replace(ds_grid_get(dungeonBlocks, floor(x1 + (tempW / 2))-1, y1-k), "blockType", 1);
                            ds_map_replace(ds_grid_get(dungeonBlocks, floor(x1 + (tempW / 2))+1, y1-k), "blockType", 1);
                        }
                        connections[door] = 1;   
                        connectionAttempt = freeConnections;
                        freeConnections--;
                        ds_map_replace(currRoom, "freeConnections", freeConnections);
                    }
                    else 
                        connectionAttempt++;
                }
                else if (door == 1 && connections[door] == 0 && (x1 + tempW + corridorLength + roomW) < argument0) {
                    if (!checkCollision(floor(x1 + tempW + corridorLength),floor(y1 + (tempH / 2) - (roomH / 2)), roomW, roomH)) {
                        addRoom(floor(x1 + tempW + corridorLength),floor(y1 + (tempH / 2) - (roomH / 2)), roomW, roomH, maxConnections);
                        for (var k = -1; k < corridorLength+1; k++) {
                            ds_map_replace(ds_grid_get(dungeonBlocks, x1 + tempW + k, floor(y1 + tempH / 2)), "blockType", 2);
                            ds_map_replace(ds_grid_get(dungeonBlocks, x1 + tempW + k, floor(y1 + tempH / 2)-1), "blockType", 1);
                            ds_map_replace(ds_grid_get(dungeonBlocks, x1 + tempW + k, floor(y1 + tempH / 2)+1), "blockType", 1);
                        }
                        connections[door] = 1;   
                        connectionAttempt = freeConnections;
                        freeConnections--;
                        ds_map_replace(currRoom, "freeConnections", freeConnections);
                    }
                    else 
                        connectionAttempt++;
                }
                else if (door == 2 && connections[door] == 0 && (y1 + tempH + corridorLength + roomH) < argument1) {
                    if (!checkCollision(floor(x1 + (tempW / 2) - (roomW / 2)),floor(y1 + tempH + corridorLength), roomW, roomH)) {
                        addRoom(floor(x1 + (tempW / 2) - (roomW / 2)),floor(y1 + tempH + corridorLength), roomW, roomH, maxConnections);
                        for (var k = -1; k < corridorLength+1; k++) {
                            ds_map_replace(ds_grid_get(dungeonBlocks, floor(x1 + (tempW / 2)), y1 + tempH + k), "blockType", 2);
                            ds_map_replace(ds_grid_get(dungeonBlocks, floor(x1 + (tempW / 2))-1, y1 + tempH + k), "blockType", 1);
                            ds_map_replace(ds_grid_get(dungeonBlocks, floor(x1 + (tempW / 2))+1, y1 + tempH + k), "blockType", 1);
                        }
                        connections[door] = 1;   
                        connectionAttempt = freeConnections;
                        freeConnections--;
                        ds_map_replace(currRoom, "freeConnections", freeConnections);
                    }
                    else 
                        connectionAttempt++;
                }
                else if (door == 3 && connections[door] == 0 && (x1 - roomW - corridorLength) > 0) {
                    if (!checkCollision(floor(x1 - roomW - corridorLength),floor(y1 + (tempH / 2) - (roomH / 2)), roomW, roomH)) {
                        addRoom(floor(x1 - roomW - corridorLength),floor(y1 + (tempH / 2) - (roomH / 2)), roomW, roomH, maxConnections);
                        for (var k = 0; k < corridorLength+2; k++) {
                            ds_map_replace(ds_grid_get(dungeonBlocks, x1 - k, floor(y1 + tempH / 2)), "blockType", 2);
                            ds_map_replace(ds_grid_get(dungeonBlocks, x1 - k, floor(y1 + tempH / 2)-1), "blockType", 1);
                            ds_map_replace(ds_grid_get(dungeonBlocks, x1 - k, floor(y1 + tempH / 2)+1), "blockType", 1);
                        }
                        connections[door] = 1;   
                        connectionAttempt = freeConnections;
                        freeConnections--;
                        ds_map_replace(currRoom, "freeConnections", freeConnections);
                    }
                    else 
                        connectionAttempt++;
                }
            }
        } 
    roomW = minRoomSize + irandom(maxRoomSize - minRoomSize + 1);
    roomH = minRoomSize + irandom(maxRoomSize - minRoomSize + 1);
}
generateChests();
addEnemies(1);
