if (argument0.eHealth < 0) {
   if (argument1 == 1)
      obj_player.experience += 45;
      gold = irandom(4)+1;

      if (irandom(100) < 51) {
         obj_player.gold += gold;
         addToLog(argument2 + " dropped " + string(gold) + " gold");
      }
      instance_destroy();
      addToLog("You defeated " + argument2 + " and gained 45 EXP.");
      
      return false;
}
else
     return true;

if (obj_player.health < 0) {
    show_message("Game over. You were killed by a " + argument2);
    game_restart();
}
