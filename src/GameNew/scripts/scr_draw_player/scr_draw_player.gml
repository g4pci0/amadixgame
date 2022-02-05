/// @function scr_draw_player(x, y)
/// @param1 x
/// @param2 y
function scr_draw_player(px, py) {

	if (actionstate == player_state_action.none){
		if (state == player_state.idle){
			//Glowa
			draw_sprite_ext(head_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Dlonie
			draw_sprite_ext(hands_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Spodnie
			draw_sprite_ext(legs_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Buty
			draw_sprite_ext(boots_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
		}
		if (state == player_state.moving){
			//Glowa
			draw_sprite_ext(head_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Spodnie
			draw_sprite_ext(legs_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Buty
			draw_sprite_ext(boots_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			//Dlonie
			draw_sprite_ext(hands_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
		}
		if (state == player_state.wading) || (state == player_state.wading_idle){
	
			//Glowa
			draw_sprite_ext(head_index,anim_frame,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Dlonie
			draw_sprite_ext(hands_index,anim_frame,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Spodnie
			draw_sprite_part_ext(legs_index,anim_frame, 0, sprite_yoffset, sprite_width, sprite_height - 4,px - sprite_xoffset,py + 4,image_xscale,image_yscale,c_white,image_alpha);
	
		}
		if (state == player_state.swimming) || (state == player_state.swimming_idle){
	
			//Glowa
			draw_sprite_part_ext(head_index,anim_frame, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);
	
			//Gorne ubranie
			draw_sprite_part_ext(torso_index,anim_frame, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);
		}
	}else
	if (actionstate == player_state_action.eating){
		var sx = (itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
		var sy = (itemeaten div obj_inventory.spr_inv_items_columns) * 24;

		if (state == player_state.idle) || (state == player_state.moving){
			//Glowa
			draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			//Spodnie
			draw_sprite_ext(legs_index,0,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			if (anim_frame_action >= 1) && (anim_frame_action <= 6){
				//Przedmiot jedzony
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 23, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, .5, itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
			//Dlonie
			draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Buty
			draw_sprite_ext(boots_index,0,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
		}
		if (state == player_state.wading_idle) || (state == player_state.wading){
			//Glowa
			draw_sprite_ext(head_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			//Spodnie
			draw_sprite_part_ext(legs_index,0, 0, sprite_yoffset, sprite_width, sprite_height - 4,px - sprite_xoffset,py + 4,image_xscale,image_yscale,c_white,image_alpha);
			
			if (anim_frame_action >= 1) && (anim_frame_action <= 6){
				//Przedmiot jedzony
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, .5, itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
			
			//Dlonie
			draw_sprite_ext(hands_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);
		}
		if (state == player_state.swimming_idle) || (state == player_state.swimming){
	
			//Glowa
			draw_sprite_part_ext(head_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);
	
			//Gorne ubranie
			draw_sprite_part_ext(torso_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);	
			
			if (anim_frame_action >= 3) && (anim_frame_action <= 5){
				//Przedmiot jedzony
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, .5, itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
			//Dlonie
			draw_sprite_part_ext(hands_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);	
		}
	}else
	if (actionstate == player_state_action.drinking){
		var sx = (itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
		var sy = (itemeaten div obj_inventory.spr_inv_items_columns) * 24;

		if (state == player_state.idle) || (state == player_state.moving){
			//Glowa
			draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			//Spodnie
			draw_sprite_ext(legs_index,0,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			if (anim_frame_action >= 1) && (anim_frame_action <= 8){
				//Przedmiot pity
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, (.5 * itemUsedYscale), itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
			
			//Dlonie
			draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Buty
			draw_sprite_ext(boots_index,0,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
		}
		if (state == player_state.wading_idle) || (state == player_state.wading){
			//Glowa
			draw_sprite_ext(head_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			//Spodnie
			draw_sprite_part_ext(legs_index,0, 0, sprite_yoffset, sprite_width, sprite_height - 4,px - sprite_xoffset,py + 4,image_xscale,image_yscale,c_white,image_alpha);
			
			if (anim_frame_action >= 1) && (anim_frame_action <= 8){
				//Przedmiot pity
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, (.5 * itemUsedYscale), itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
			
			//Dlonie
			draw_sprite_ext(hands_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);


		}
		if (state == player_state.swimming_idle) || (state == player_state.swimming){
	
			//Glowa
			draw_sprite_part_ext(head_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);
	
			//Gorne ubranie
			draw_sprite_part_ext(torso_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);	
			
			//Dlonie
			draw_sprite_part_ext(hands_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);	
			
			if (anim_frame_action >= 3) && (anim_frame_action <= 7){
				//Przedmiot pity
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, (.5 * itemUsedYscale), itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
		}
	}else
	if (actionstate == player_state_action.attacking_melee){
		if (state == player_state.idle) || (state == player_state.moving){
			
			var sx = (itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
			var sy = (itemeaten div obj_inventory.spr_inv_items_columns) * 24;
			
			switch(facing){
				case dirc.down: //Za dlonia
					//Glowa
					draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Gorne ubranie
					draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Spodnie
					draw_sprite_ext(legs_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Buty
					draw_sprite_ext(boots_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
			
					//Bron
					/*
					if (anim_frame_action >= 0.1){
						draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), 1, (itemUsedYscale), itemUsedAngle, c_white, c_white, c_white, c_white, 1);
						if (instance_exists(obj_melee_attack)){
							with (obj_melee_attack){
								yorigin = obj_amadix.yorigin + 1;
								face = dirc.down;
							}
						}
					}
					*/
					
					//Dlonie
					draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
				break;
				case dirc.left: // Roznie
			
					//Glowa
					draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Gorne ubranie
					draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Spodnie
					draw_sprite_ext(legs_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Buty
					draw_sprite_ext(boots_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
			
					
					//Dlonie
					draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
				break;
				case dirc.right: // Roznie
			
					//Glowa
					draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Gorne ubranie
					draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Spodnie
					draw_sprite_ext(legs_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Buty
					draw_sprite_ext(boots_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
		
					
					//Dlonie
					draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
				break;
				case dirc.up: // Za wszystkim
			
					//Glowa
					draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Gorne ubranie
					draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Spodnie
					draw_sprite_ext(legs_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Buty
					draw_sprite_ext(boots_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
					
					//Dlonie
					draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
				break;
			}
		}
	}
}
