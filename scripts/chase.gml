grid_size = argument3
wall = argument1
grid = mp_grid_create(0,0,room_width/grid_size, room_height/grid_size, grid_size, grid_size)
mp_grid_add_instances(grid, wall, false)
path = path_add()
current_point = 0 
max_point = 0 



//distance from player
Player = argument0
spd = argument2

dist = distance_to_object(Player)
if (instance_exists(Player))
{
    target = Player
}

failed = mp_grid_path(grid,path,x,y,Player.x,Player.y,true);

if dist > 1 && failed > 0
{
//follow player
if(moving)
{
    if(current_point < max_points && 
    !collision_line(x, y, path_get_point_x(path, current_point+1), 
    path_get_point_y(path, current_point+1), wall, 0, 1))
    {
        current_point +=1
    }
    
    mp_potential_step(path_get_point_x(path, current_point), 
    path_get_point_y(path, current_point), spd, 1)
    
    if(point_distance(x, y, path_get_point_x(path, max_points-1),
    path_get_point_y(path, max_points-1)) < reach)
    {
        path_clear_points(path)
        moving = false
    }
}}

if(instance_exists(target)) && dist > 1 
{
    if(mp_grid_path(grid, path, x, y, target.x, target.y, true))
    {
        moving = true
        current_point =0
        max_points = path_get_number(path)
    }
}

//mp_potential_step(Player.x, Player.y, 2, 1);
if dist < 32
image_angle = point_direction(x, y, Player.x, Player.y)
else
image_angle = direction

mp_grid_destroy(grid);
path_delete(path);
