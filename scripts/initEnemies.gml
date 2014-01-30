enemyTypes = ds_list_create();
ds_list_add(enemyTypes,"Small Rat");
ds_list_add(enemyTypes,"Slime");
ds_list_add(enemyTypes,"Knight");

//Stores enemy information
//[0]       Enemy name
//[1]       Enemy quantity
//[2]-[n]   Enemy object
enemies = ds_grid_create(2+maxEnemyNumber, maxEnemies);

for (i = 0; i < ds_list_size(enemies); i++) {
    ds_grid_add(enemies, 0, i, ds_list_find_value(enemyTypes, i));
}
