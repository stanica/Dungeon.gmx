var localX = argument0.x;
var localY = argument0.y;
var counter = 0;

while (counter < 15) {
var modX = choose(0,32,-32);
var modY = choose(0,32,-32);
if (place_free(localX+modX, localY+modY))
   return instance_create(localX+modX, localY+modY, argument1);
   counter++;
}
