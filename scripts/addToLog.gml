//addToLog(message)
ds_list_add(combatStrings, argument0);
logSize = ds_list_size(combatStrings);

if(logSize > 35) {
    ds_list_delete(combatStrings,0);
    ds_list_delete(combatStrings,1);
    ds_list_delete(combatStrings,2);
    ds_list_delete(combatStrings,3);
    ds_list_delete(combatStrings,4);
    logIndex -= 5;
}

if (logSize > 5) 
   logIndex++;
