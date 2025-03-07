
if (instance_exists(obj_inventory)){
	if (!obj_inventory.show_inventory) && (!obj_inventory.show_slots) && (show_container){		
		
	////////////////
	if (global.debugMode){
	draw_set_color(c_yellow);
	draw_text(16, 64 + 12*1, "sel " + string(selected_slot));
	draw_text(16, 64 + 12*2, "seleq " + string(selected_slot_eq));
	draw_text(16, 64 + 12*3, "mltp " + string(multipick));
	draw_text(16, 64 + 12*4, "inh " + string(inhand));
	draw_text(16, 64 + 12*5, "cap " + string(cap));
	if (selected_slot!=-1)draw_text(16, 64 + 12*6, "conitem " + string(ds_container[# INVITEM, selected_slot]));
	if (selected_slot_eq!=-1)draw_text(16, 64 + 12*7, "eqitem " + string(obj_inventory.ds_inventory[# INVITEM, selected_slot_eq]));
	if (selected_slot!=-1)draw_text(16, 64 + 12*8, "conam " + string(ds_container[# INVAMOUNT, selected_slot]));
	if (selected_slot_eq!=-1)draw_text(16, 64 + 12*9, "eqam " + string(obj_inventory.ds_inventory[# INVAMOUNT, selected_slot_eq]));
	}
	////////////////
		
	draw_sprite_ext(obj_inventory.spr_eq_slotback, 0, 92, 152, 1, 1, 0, c_white, 1);
	
	//Inventory
	var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;
	ii = 0; ix = 0; iy = 0; inv_grid = obj_inventory.ds_inventory;
	var jj = 0;
	var wh = c_white;
	var bl = c_black;
	var con_grid = ds_container;
	
	#region Strona ekwipunku
	
	ii = obj_inventory.page * obj_inventory.slots_onpage;
	
		repeat (obj_inventory.slots_onpage){
			
				//x,y slotow
				xx = slots_x_eq + ((cell_size) * ix * 1);
				yy = slots_y_eq + ((cell_size) * iy * 1);
		
				//Przedmiot
				iitem = inv_grid[# INVITEM, ii];
				sx = (iitem mod obj_inventory.spr_inv_items_columns) * cell_size;
				sy = (iitem div obj_inventory.spr_inv_items_columns) * cell_size;
		
				//Rysuj slot i przedmiot
		
				if (iitem > 0) && (inv_grid[# 1, ii] > 0){
					switch(ii){
						case selected_slot_eq:
										//draw selected slot
										draw_sprite_ext(obj_inventory.spr_inv_slot_selected, 0, xx, yy, 1, 1, 0, c_white, 1);
										//draw item
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
										
										gpu_set_blendmode(bm_add);
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, .2);
										gpu_set_blendmode(bm_normal);
										
									if (selected_slot_eq == obj_inventory.picked_slot){
										if (multipick > 0){
										//draw selected slot
										draw_sprite_ext(obj_inventory.spr_inv_slot_selected, 0, xx, yy, 1, 1, 0, c_white, 1);
										//draw item
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
										
										gpu_set_blendmode(bm_add);
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, .2);
										gpu_set_blendmode(bm_normal);
										}else{
											draw_sprite_ext(obj_inventory.spr_inv_slot_none, 0, xx, yy, 1, 1, 0, c_white, 1);
										}
									
									}else if (selected_slot_eq != obj_inventory.picked_slot){
										if (multipick > 0){
										//draw selected slot
										draw_sprite_ext(obj_inventory.spr_inv_slot_selected, 0, xx, yy, 1, 1, 0, c_white, 1);
										//draw item
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
										
										gpu_set_blendmode(bm_add);
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, .2);
										gpu_set_blendmode(bm_normal);
										}else{
											break;	
										}
									}
						break;
						case obj_inventory.picked_slot:
									if (multipick > 0){
										draw_sprite_ext(obj_inventory.spr_inv_slot_none, 0, xx, yy, 1, 1, 0, c_white, 1);
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
									}else{
										draw_sprite_ext(obj_inventory.spr_inv_slot_none, 0, xx, yy, 1, 1, 0, c_white, .2);
									}
						break;
						default:
									if (inv_grid[# 1, ii] > 0){
										//draw_sprite_ext(spr_inv_slot_none, 0, xx, yy, 1, 1, 0, c_white, 1);
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
									}
						break;
					}
				}
		
				//Rysuj liczbe przedmiotow
					if (iitem > 0){
						var amount = inv_grid[# 1, ii];
						var _cap = inv_grid[# INVCAP, ii];
						if (amount != 0){
							if (inv_grid[# INVTYPE, ii] == itemtype.drink)
							|| (inv_grid[# INVTYPE, ii] == itemtype.alcohol){
								draw_rectangle_color(xx + 4, yy + 20, xx + 20, yy + 22, bl, bl, bl, bl, false);
								draw_rectangle_color(xx + 4.5, yy + 20.5, xx + 3 + (_cap*3.28) , yy + 21.5, wh, wh, wh, wh, false);
							}else if (inv_grid[# INVTYPE, ii] == itemtype.magazine){
									draw_set_font(global.font_itemnum);
									draw_set_halign(fa_right);
									draw_text_transformed_color(xx + 22, yy + 16, string(_cap), .5, .5, 0, wh, wh, wh, wh, 1);
									draw_set_halign(fa_left);
									draw_set_font(font_item);
							}else{
								if (amount > 1){
									draw_set_font(global.font_itemnum);
									draw_set_halign(fa_right);
									draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, 1);
									draw_set_halign(fa_left);
									draw_set_font(font_item);
								}
							}
						}

					}

		
		
				//Przelec przez cala siatke przedmiotow
						ii += 1;
						jj += 1;
						ix = ii mod obj_inventory.inv_slots_width;
						iy = jj div obj_inventory.inv_slots_width;
		
		}
	
	#endregion
			
		
	#region Strona pojemnika
	
	ii = 0;
	jj = 0;
	ix = 0;
	iy = 0;
	xx = 0;
	yy = 0;
	sx = 0;
	sy = 0;
	
	if (containerSlotWidth == 3){
		scaleDesiredX = 2.22;	
		scaleDesiredY = 2.22;	
	}
	
	if (containerSlotWidth == 12){
		scaleDesiredX = 7.63;	
		scaleDesiredY = 2.82;	
	}
	
	draw_sprite_ext(spr_hud_container, 0, xUI - 8, yUI - 8, scaleDesiredX, scaleDesiredY, 0, c_white, 1);
	
		repeat (containerSlots){
			
				//x,y slotow
				xx = slots_x + ((cell_size) * ix * 1);
				yy = slots_y + ((cell_size) * iy * 1);
		
				//Przedmiot
				iitem = con_grid[# INVITEM, ii];
				sx = (iitem mod obj_inventory.spr_inv_items_columns) * cell_size;
				sy = (iitem div obj_inventory.spr_inv_items_columns) * cell_size;
		
				//Rysuj slot i przedmiot
		
				if (iitem > 0) && (con_grid[# 1, ii] > 0){
					switch(ii){
						case selected_slot:
										//draw selected slot
										draw_sprite_ext(spr_inv_slot_selected, 0, xx, yy, 1, 1, 0, c_white, 1);
										//draw item
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
										
										gpu_set_blendmode(bm_add);
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, .2);
										gpu_set_blendmode(bm_normal);
										
									if (selected_slot == obj_inventory.picked_slot){
										if (multipick > 0){
										//draw selected slot
										draw_sprite_ext(spr_inv_slot_selected, 0, xx, yy, 1, 1, 0, c_white, 1);
										//draw item
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
										
										gpu_set_blendmode(bm_add);
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, .2);
										gpu_set_blendmode(bm_normal);
										}else{
											draw_sprite_ext(obj_inventory.spr_inv_slot_none, 0, xx, yy, 1, 1, 0, c_white, 1);
										}
									
									}else if (selected_slot != obj_inventory.picked_slot){
										if (multipick > 0){
										//draw selected slot
										draw_sprite_ext(spr_inv_slot_selected, 0, xx, yy, 1, 1, 0, c_white, 1);
										//draw item
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
										
										gpu_set_blendmode(bm_add);
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, .2);
										gpu_set_blendmode(bm_normal);
										}else{
											break;	
										}
									}
						break;
						case obj_inventory.picked_slot:
									if (multipick > 0){
										draw_sprite_ext(spr_inv_slot_none, 0, xx, yy, 1, 1, 0, c_white, 1);
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
									}else{
										draw_sprite_ext(obj_inventory.spr_inv_slot_none, 0, xx, yy, 1, 1, 0, c_white, .2);
									}
						break;
						default:
									if (con_grid[# 1, ii] > 0){
										//draw_sprite_ext(spr_inv_slot_none, 0, xx, yy, 1, 1, 0, c_white, 1);
										draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
									}
						break;
					}
				}
		
				//Rysuj liczbe przedmiotow
				if (iitem > 0){
					var amount = con_grid[# INVAMOUNT, ii];
					var _cap = con_grid[# INVCAP, ii];
					if (amount != 0){
						if (con_grid[# INVTYPE, ii] == itemtype.drink) 
						|| (con_grid[# INVTYPE, ii] == itemtype.alcohol){
								draw_rectangle_color(xx + 4, yy + 20, xx + 20, yy + 22, bl, bl, bl, bl, false);
								draw_rectangle_color(xx + 4.5, yy + 20.5, xx + 3 + (_cap*3.28) , yy + 21.5, wh, wh, wh, wh, false);
								
						}else if (con_grid[# INVITEM, ii] == item.m1911mag){
								draw_set_font(global.font_itemnum);
								draw_set_halign(fa_right);
								draw_text_transformed_color(xx + 22, yy + 16, string(_cap), .5, .5, 0, wh, wh, wh, wh, 1);
								draw_set_halign(fa_left);
								draw_set_font(font_item);
						}else{
							if (amount > 1){
								draw_set_font(global.font_itemnum);
								draw_set_halign(fa_right);
								draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, 1);
								draw_set_halign(fa_left);
								draw_set_font(font_item);
							}
						}
					}
				}

		
		
				//Przelec przez cala siatke przedmiotow
						ii += 1;
						jj += 1;
						ix = ii mod containerSlotWidth;
						iy = jj div containerSlotWidth;
		
		}
	
	#endregion
		
	#region Rysowanie przedmiotow przenoszonych
	if (multipick != 0){
			//Przedmiot
			iitem = inhand;
			sx = (iitem mod obj_inventory.spr_inv_items_columns) * cell_size;
			sy = (iitem div obj_inventory.spr_inv_items_columns) * cell_size;
			draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, mousex, mousey, 1, 1, c_white, 1);
			var inuma = multipick;
			var _cap = cap;
			
			if (obj_inventory.ds_item_all[# INVTYPE, iitem] == itemtype.drink) || (obj_inventory.ds_item_all[# INVTYPE, iitem] == itemtype.alcohol){
					draw_rectangle_color(mousex + 4, mousey + 20, mousex + 20, mousey + 22, bl, bl, bl, bl, false);
					draw_rectangle_color(mousex + 4.5, mousey + 20.5, mousex + 3 + (_cap*3.28) , mousey + 21.5, wh, wh, wh, wh, false);
			}else if (obj_inventory.ds_item_all[# INVTYPE, iitem] == itemtype.magazine){
					draw_set_font(global.font_itemnum);
					draw_text_transformed_color(mousex + 16, mousey + 16, string(_cap), .5, .5, 0, wh, wh, wh, wh, 1);
					draw_set_font(font_item);
			}else{
				if (inuma > 1){
					draw_set_font(global.font_itemnum);
					draw_text_transformed_color(mousex + 16, mousey + 16, string(inuma), .5, .5, 0, wh, wh, wh, wh, 1);
					draw_set_font(font_item);
				}
			}
		
	}
	#endregion
		
	}
}