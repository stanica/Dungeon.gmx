var enemy = argument0;

//Determine who gets first attack
with(enemy) {
    if (dexterity > obj_player.dexterity) {
        obj_player.health -= meleeDamage(strength, attackDamage, obj_player.defense, obj_player.armor, obj_player.dexterity);
        checkHealth(enemy, argument1);
        eHealth -= meleeDamage(obj_player.strength, obj_player.attackDamage, defense, armor, dexterity);
        checkHealth(enemy, argument1);
    }
    else {
        obj_player.health -= meleeDamage(strength, attackDamage, obj_player.defense, obj_player.armor, obj_player.dexterity);
        checkHealth(enemy, argument1);
        eHealth -= meleeDamage(obj_player.strength, obj_player.attackDamage, defense, armor, dexterity);
        checkHealth(enemy, argument1);
    }
}
