if (argument0.eHealth < 0) {
        if (argument1 == 1)
            obj_player.experience += 45;
        instance_destroy();
        ds_stack_push(combatStrings, "You defeated " + argument2);
}
if (obj_player.health < 0) {
    show_message("Game over.");
    game_restart();
}
