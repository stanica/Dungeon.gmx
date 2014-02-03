if (argument0.eHealth < 0) {
        if (argument1 == 1)
            obj_player.experience += 45;
        instance_destroy();
}
if (obj_player.health < 0)
    game_restart();
