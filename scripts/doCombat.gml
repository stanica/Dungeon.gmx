var enemy = argument0;
var damage = 0; 

//Determine who gets first attack
with(enemy) {
    if (dexterity > obj_player.dexterity) {
        damage = meleeDamage(strength, attackDamage, obj_player.defense, obj_player.armor, obj_player.dexterity);
        obj_player.health -= damage; 
        ds_stack_push(combatStrings, "Enemy " + enemyString + " hit you for " + string(damage) + " damage");
        checkHealth(enemy, argument1, enemyString);
        eHealth -= meleeDamage(obj_player.strength, obj_player.attackDamage, defense, armor, dexterity);
        checkHealth(enemy, argument1, enemyString);
    }
    else {
        damage = meleeDamage(strength, attackDamage, obj_player.defense, obj_player.armor, obj_player.dexterity);
        obj_player.health -= damage;
        ds_stack_push(combatStrings, "You hit " + enemyString + " for " + string(damage) + " damage")
        checkHealth(enemy, argument1, enemyString);
        damage = meleeDamage(obj_player.strength, obj_player.attackDamage, defense, armor, dexterity);
        eHealth -= damage;
        checkHealth(enemy, argument1, enemyString);
    }
}
