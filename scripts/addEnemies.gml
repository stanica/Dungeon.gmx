if (argument0 == 1) {
   var numEnemies = irandom(maxEnemyNumber - 8) + 8;show_message(numEnemies);
   var currentEnemy = 0;
   var generatedEnemies = 0;
   var exists = false;
   var rat;
   while(generatedEnemies < numEnemies) {
        var ran = irandom(ds_list_size(rooms)-2) + 1
        var chosenRoom = ds_list_find_value(rooms, ran);
        var roomX = ds_map_find_value(chosenRoom, "x1");
        var roomY = ds_map_find_value(chosenRoom, "y1");
        var width = ds_map_find_value(chosenRoom, "width");
        var height = ds_map_find_value(chosenRoom, "height");
        var paddingX = irandom(width - 3) + 1;
        var paddingY = irandom(height - 3) + 1;
        while (!exists && ds_grid_get(enemies,1,0) > 0 && currentEnemy < ds_grid_get(enemies,1,0)) {
              rat = ds_grid_get(enemies, 2+currentEnemy, 0);
              if (rat.x == paddingX || rat.y == paddingY)
                 exists = true;
              else
                  currentEnemy++;
        }
        currentEnemy = 0;
        generatedEnemies++;
        var rat = instance_create((roomX + paddingX)* 32, (roomY + paddingY) * 32, obj_smallRat);
        show_message(ds_grid_get(enemies,1,0)+2);
        ds_grid_set(enemies, ds_grid_get(enemies,1,0)+2, 1, rat);
        ds_grid_set(enemies, 1, 0, ds_grid_get(enemies,1,0)+1);
    }
}
show_message(ds_grid_get(enemies,1,0));

