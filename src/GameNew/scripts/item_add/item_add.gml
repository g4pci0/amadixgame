function item_add(slot, iitem, amount, level, capacity){
	/*
	if (capacity > -1) && (slot == -1){
		if (item_exists(item.none, false)){
			item_mag_add(iitem, capacity, level);
		}else{
			if (instance_exists(obj_amadix)){
				item_drop(iitem, amount, level, capacity, true, obj_amadix.x, obj_amadix.y, 5);		
			}
		}
		exit;
	}
	*/
	

	
	
	
	if (slot == -1){
		if (item_exists(item.none, false)){
			
			var newitemam = capacity == -1 ? amount : capacity;
			var newitemid = iitem;
			if (instance_exists(obj_amadix)){
				var ID = instance_create_layer(obj_amadix.x, obj_amadix.y, MAINSCR, obj_newitem);
				with (ID){
					newItemID = newitemid;
					newItemAmount = newitemam;
				}
			}
			
			
			if (amount > obj_inventory.ds_item_all[# MAXSTACK, iitem]){
				var maxstack = obj_inventory.ds_item_all[# MAXSTACK, iitem];
				var rep = (amount div maxstack);
				var reminder = (amount mod maxstack);
				
				repeat(rep){
					item_stack(iitem, maxstack, level, capacity);
				}
				if (reminder != 0)
					item_stack(iitem, reminder, level, capacity);
				
			}else{
				item_stack(iitem, amount, level, capacity);
			}
		}else{
			if (instance_exists(obj_amadix)){
				item_drop(iitem, amount, level, capacity, true, obj_amadix.x, obj_amadix.y, 5);	
			}
		}
	}else{
		obj_inventory.ds_inventory[# INVITEM, slot] = iitem;
		obj_inventory.ds_inventory[# INVTYPE, slot] = obj_inventory.ds_item_all[# INVTYPE, iitem];
		obj_inventory.ds_inventory[# INVHP, slot] = obj_inventory.ds_item_all[# INVHP, iitem];
		obj_inventory.ds_inventory[# INVSTAMINA, slot] = obj_inventory.ds_item_all[# INVSTAMINA, iitem];
		obj_inventory.ds_inventory[# INVLEVEL, slot] = level;
		obj_inventory.ds_inventory[# INVDAMAGE, slot] = obj_inventory.ds_item_all[# INVDAMAGE, iitem];
		obj_inventory.ds_inventory[# INVDEFENCE, slot] = obj_inventory.ds_item_all[# INVDEFENCE, iitem];
		obj_inventory.ds_inventory[# INVEFFECTS, slot] = obj_inventory.ds_item_all[# INVEFFECTS, iitem];
		obj_inventory.ds_inventory[# INVTEMPERATURE, slot] = obj_inventory.ds_item_all[# INVTEMPERATURE, iitem];
		if (capacity > -1){
			obj_inventory.ds_inventory[# INVCAP, slot] = capacity;
			obj_inventory.ds_inventory[# MAXSTACK, slot] = 1;
			obj_inventory.ds_inventory[# INVAMOUNT, slot] = 1;
		}else{
			obj_inventory.ds_inventory[# INVCAP, slot] = -1;
			obj_inventory.ds_inventory[# MAXSTACK, slot] = obj_inventory.ds_item_all[# MAXSTACK, iitem];
			obj_inventory.ds_inventory[# INVAMOUNT, slot] = amount;
		}
	}
}