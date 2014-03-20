if (argument0.eHealth < 0) {
   if (argument1 == 1)
      obj_player.experience += 45;
      instance_destroy();
      ds_list_add(combatStrings, "You defeated " + argument2);
      return false;
}
else
     return true;

if (obj_player.health < 0) {
    show_message("Game over. You were killed by a " + argument2);
    game_restart();
}
