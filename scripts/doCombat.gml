var enemy = argument0;
var damage = 0; 

//Determine who gets first attack
with(enemy) {
    if (dexterity > obj_player.dexterity) {
       damage = meleeDamage(strength, attackDamage, obj_player.defense, obj_player.armor, obj_player.dexterity);
       obj_player.health -= damage; 
       addToLog("Enemy " + name + " hit you for " + string(damage) + " damage.");
       if (instance_exists(enemy)) {
          damage = meleeDamage(obj_player.strength, obj_player.attackDamage, defense, armor, dexterity);
          eHealth -= damage;
          addToLog("You hit " + name + " for " + string(damage) + " damage.")
       }
    }
    else {
         damage = meleeDamage(obj_player.strength, obj_player.attackDamage, defense, armor, dexterity);
         eHealth -= damage;
         addToLog("You hit " + name + " for " + string(damage) + " damage.")
         if (instance_exists(enemy)){
            damage = meleeDamage(strength, attackDamage, obj_player.defense, obj_player.armor, obj_player.dexterity);
            obj_player.health -= damage; 
            addToLog("Enemy " + name + " hit you for " + string(damage) + " damage.");
         }
    }
}
