///meleeDamage(a_strength, a_attackDamage, d_defense, d_armor, d_dexterity)
var damage = (argument0+argument1)/(argument2+argument3) * argument1;
var evasionRate = irandom_range(1,100 / ceil(argument4 / 3));

if (evasionRate == 1) {
   addToLog(name + " dodged the attack.");
    return 0;
}
else
    return floor(damage);
