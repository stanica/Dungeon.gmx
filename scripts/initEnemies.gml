enemyTypes = ds_list_create();
ds_list_add(enemyTypes,"smallRat");
ds_list_add(enemyTypes,"slime");
ds_list_add(enemyTypes,"knight");

//Stores enemy information
//[0]       Enemy name
//[1]       Enemy quantity
//[2]-[n]   Enemy object
enemies = ds_grid_create(2+maxEnemyNumber, ds_list_size(enemyTypes));

for (i = 0; i < ds_list_size(enemyTypes); i++) {
    ds_grid_set(enemies, 0, i, "obj_"+ds_list_find_value(enemyTypes,i));
    ds_grid_set(enemies, 1, i, 0);
}
