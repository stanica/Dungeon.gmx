var enemy = argument0;
var damage = 0; 

//Determine who gets first attack
with(enemy) {
    if (dexterity > obj_player.dexterity) {
       addToLog("Enemy hit you first."); 
       damage = meleeDamage(strength, attackDamage, obj_player.defense, obj_player.armor, obj_player.dexterity);
       obj_player.health -= damage; 
       addToLog("Enemy " + enemyString + " hit you for " + string(damage) + " damage.");
       if (checkHealth(enemy, argument1, enemyString)) {
          damage = meleeDamage(obj_player.strength, obj_player.attackDamage, defense, armor, dexterity);
          eHealth -= damage;
          addToLog("You hit " + enemyString + " for " + string(damage) + " damage.")
          checkHealth(enemy, argument1, enemyString);
       }
    }
    else {
         addToLog("You hit enemy first.");
         damage = meleeDamage(obj_player.strength, obj_player.attackDamage, defense, armor, dexterity);
         eHealth -= damage;
         addToLog("You hit " + enemyString + " for " + string(damage) + " damage.")
         if (checkHealth(enemy, argument1, enemyString)){
            damage = meleeDamage(strength, attackDamage, obj_player.defense, obj_player.armor, obj_player.dexterity);
            obj_player.health -= damage; 
            addToLog("Enemy " + enemyString + " hit you for " + string(damage) + " damage.");
            checkHealth(enemy, argument1, enemyString);
         }
    }
}
