switch(actionstate){
	case player_state_action.eating:
		obj_inventory.ds_inventory[# INVAMOUNT, obj_inventory.mouse_slotx_second] -= 1;	
		actionstate = player_state_action.none;
		item_add_effect(itemeaten);
		itemeaten = -1;
	break;
	case player_state_action.drinking:
		if (obj_inventory.ds_inventory[# MAXCAP, obj_inventory.mouse_slotx_second] == -1){
			obj_inventory.ds_inventory[# INVAMOUNT, obj_inventory.mouse_slotx_second] -= 1;	
		}else{
			obj_inventory.ds_inventory[# INVCAP, obj_inventory.mouse_slotx_second] -= 1;	
		}
		actionstate = player_state_action.none;
		item_add_effect(itemeaten);
		itemeaten = -1;
	break;
	case player_state_action.attacking_melee:
		actionstate = player_state_action.none;
		itemeaten = -1;
	break;
	case player_state_action.pickup:
		actionstate = player_state_action.none;
		item_add(-1, itemeaten, itemamount, itemlvl, itemcap);
		itemeaten = -1;
		itemamount = 0;
		pickupid = -1;
		pickupTrigger = false;
	break;
}

attackSpeedFix = false;

if (time_source_exists(stopEatingTimer)){
	time_source_destroy(stopEatingTimer);
}