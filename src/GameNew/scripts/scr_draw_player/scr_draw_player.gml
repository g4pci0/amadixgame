function scr_draw_player(px, py, pz) {
	
var flow = sin(obj_gamecontrol.refTimerPi);
	
function drawPlayerNormal(xx, yy, zz, cutoff) {
	
	var flow = 0;
	
	if ((state == player_state.swimming)
	|| (state == player_state.swimming_idle)){
		flow = sin(obj_gamecontrol.refTimerPi);
	}else{
		flow = 0;	
	}
	
	
	//----------------------------------------------------------------------------------------------------------------
	
		//Dlonie
		draw_sprite_part_ext(hands2_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
		if (cutoff)
			draw_sprite_part_ext(hands2_index,anim_frame,0,sprite_yoffset+zz,sprite_width,zz,xx-sprite_xoffset,yy+(zz*2),image_xscale,image_yscale,c_white,image_alpha/8);

		//Bron biala
		if ( (facing == index_facing.left)) {
			if (!cutoff)
				draw_sprite_general(melee_index,0,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset+iteminhandX,yy+zz+iteminhandY,image_xscale,image_yscale,iteminhandAngle,c_white,c_white,c_white,c_white,image_alpha);	
		}
	
		//Glowa
		draw_sprite_part_ext(head_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz+flow,image_xscale,image_yscale,c_white,image_alpha);

		//Gorne ubranie
		draw_sprite_part_ext(torso_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz+flow,image_xscale,image_yscale,c_white,image_alpha);
		if (cutoff)
			draw_sprite_part_ext(torso_index,anim_frame,0,sprite_yoffset+zz,sprite_width,zz,xx-sprite_xoffset,yy+(zz*2)+flow,image_xscale,image_yscale,c_white,image_alpha/8);
			
		//Spodnie
		draw_sprite_part_ext(legs_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz+flow,image_xscale,image_yscale,c_white,image_alpha);
		if (cutoff)
			draw_sprite_part_ext(legs_index,anim_frame,0,sprite_yoffset+zz,sprite_width,zz,xx-sprite_xoffset,yy+(zz*2)+flow,image_xscale,image_yscale,c_white,image_alpha/8);
			
		//Buty
		draw_sprite_part_ext(boots_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz+flow,image_xscale,image_yscale,c_white,image_alpha);
		if (cutoff)
			draw_sprite_part_ext(boots_index,anim_frame,0,sprite_yoffset+zz,sprite_width,zz,xx-sprite_xoffset,yy+(zz*2)+flow,image_xscale,image_yscale,c_white,image_alpha/8);
			
		//Bron biala
		if ( (facing == index_facing.right)) {
			if (!cutoff)
				draw_sprite_general(melee_index,0,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset+iteminhandX,yy+zz+iteminhandY,image_xscale,image_yscale,iteminhandAngle,c_white,c_white,c_white,c_white,image_alpha);	
		}
		
		//Dlonie
		draw_sprite_part_ext(hands_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz+flow,image_xscale,image_yscale,c_white,image_alpha);
		if (cutoff)
			draw_sprite_part_ext(hands_index,anim_frame,0,sprite_yoffset+zz,sprite_width,zz,xx-sprite_xoffset,yy+(zz*2)+flow,image_xscale,image_yscale,c_white,image_alpha/8);
			
		//Bron biala
		if ( (facing == index_facing.up) || (facing == index_facing.down) ) {
			if (!cutoff)
				draw_sprite_part_ext(melee_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);	
		}
		
		//Czapka
		draw_sprite_ext(hat_index,hat_frame,xx,yy + zz - 12 + hatY + 32 + flow,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
	
	//----------------------------------------------------------------------------------------------------------------
}
function drawPlayerEating(xx, yy, zz, cutoff) {
	var sx = (itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
	var sy = (itemeaten div obj_inventory.spr_inv_items_columns) * 24;
	//----------------------------------------------------------------------------------------------------------------
	
		//Glowa
		draw_sprite_part_ext(head_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
		//Gorne ubranie
		draw_sprite_part_ext(torso_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
		//Spodnie
		draw_sprite_part_ext(legs_index,0,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
		if (anim_frame_action >= 0.1) && (anim_frame_action <= 6){
			//Przedmiot jedzony
			draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 23, 24 - itemUsedSx, xx - 7 + (itemUsedX), yy + zz + 13 + (itemUsedY), .5, .5, itemUsedAngle, c_white, c_white, c_white, c_white, 1);
		}
	
		//Dlonie
		draw_sprite_part_ext(hands_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);

		//Buty
		draw_sprite_part_ext(boots_index,0,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
					
		//Czapka
		draw_sprite_ext(hat_index,hat_frame,xx,yy + zz - 12 + hatY + 32,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	

	//----------------------------------------------------------------------------------------------------------------
}
function drawPlayerDrinking(xx, yy, zz, cutoff) {
	var sx = (itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
	var sy = (itemeaten div obj_inventory.spr_inv_items_columns) * 24;
	
	//----------------------------------------------------------------------------------------------------------------
	
		//Glowa
		draw_sprite_part_ext(head_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
		//Gorne ubranie
		draw_sprite_part_ext(torso_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
		//Spodnie
		draw_sprite_part_ext(legs_index,0,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
		if ((anim_frame_action >= 0.1) && (anim_frame_action <= 1.8)) || ((anim_frame_action >= 8) && (anim_frame_action <= 10)){
			//Przedmiot pity
			draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, xx - 7 + (itemUsedX), yy + zz + 13 + (itemUsedY), .5, (.5 * itemUsedYscale), itemUsedAngle, c_white, c_white, c_white, c_white, 1);
		}
	
		//Dlonie
		draw_sprite_part_ext(hands_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);

		//Buty
		draw_sprite_part_ext(boots_index,0,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
					
		//Czapka
		draw_sprite_ext(hat_index,hat_frame,xx,yy + zz - 12 + hatY + 32,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

	//----------------------------------------------------------------------------------------------------------------
	
}
function drawPlayerPickup(xx, yy, zz, cutoff) {
	var sx = (itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
	var sy = (itemeaten div obj_inventory.spr_inv_items_columns) * 24;
	
	//----------------------------------------------------------------------------------------------------------------
	
		//Glowa
		draw_sprite_part_ext(head_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
		//Gorne ubranie
		draw_sprite_part_ext(torso_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
		//Spodnie
		draw_sprite_part_ext(legs_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);

		
		if (pickupTrigger){
			if (anim_frame_action >= 1){
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, xx - 7 + (itemUsedX), yy + zz + 13 + (itemUsedY), .5, (.5 * itemUsedYscale), itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
		}else{
			if (anim_frame_action >= 2){
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, xx - 7 + (itemUsedX), yy + zz + 13 + (itemUsedY), .5, (.5 * itemUsedYscale), itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
		}
	
		//Dlonie
		draw_sprite_part_ext(hands_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);

		//Buty
		draw_sprite_part_ext(boots_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
					
		//Czapka
		draw_sprite_ext(hat_index,hat_frame,xx,yy + zz - 12 + hatY + 32,image_xscale,image_yscale,hat_rot,image_blend,image_alpha);	

	//----------------------------------------------------------------------------------------------------------------
	
}
function drawPlayerMelee(xx, yy, zz, cutoff) {
	//----------------------------------------------------------------------------------------------------------------
	
		//Glowa
		draw_sprite_part_ext(head_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);

		//Dlonie
		draw_sprite_part_ext(hands_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);

		//Gorne ubranie
		draw_sprite_part_ext(torso_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);

		//Spodnie
		draw_sprite_part_ext(legs_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
		//Buty
		draw_sprite_part_ext(boots_index,anim_frame_action,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
					
		//Czapka
		draw_sprite_ext(hat_index,hat_frame,xx,yy + zz - 12 + hatY + 32,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
		
	//----------------------------------------------------------------------------------------------------------------
}
function drawPlayerHandgun(xx, yy, zz, cutoff) {
	//----------------------------------------------------------------------------------------------------------------
	
	switch(facing){
		case index_facing.down:
		//----------------------------------------------------------------------------------------------------------------
		
			if (instance_exists(obj_gun_logic)){obj_gun_logic.depth = depth - 1;}
						//Glowa
						draw_sprite_part_ext(head_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
						//Gorne ubranie
						draw_sprite_part_ext(torso_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
						//Spodnie
						draw_sprite_part_ext(legs_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);

						//Buty
						draw_sprite_part_ext(boots_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);	
		
						//Rece i dlonie
						if (instance_exists(obj_gun_logic)){
							if (obj_gun_logic.state == gunState.reloading) || (obj_gun_logic.state == gunState.reloading_empty){
								draw_sprite_ext(arms_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
								draw_sprite_ext(hands_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
							}else if (obj_gun_logic.state == gunState.shooting){
								draw_sprite_ext(arms_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
								draw_sprite_ext(hands_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
								draw_sprite_ext(arms2_index,anim_frame_action,xx + hand_xoffset2,yy + zz + hand_yoffset2,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
								draw_sprite_ext(hands2_index,anim_frame_action,xx + hand_xoffset2,yy + zz + hand_yoffset2,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
							}else{
								draw_sprite_ext(arms_index,anim_frame,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
								draw_sprite_ext(hands_index,anim_frame,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
								draw_sprite_ext(arms2_index,anim_frame,xx + hand_xoffset2,yy + zz + hand_yoffset2,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
								draw_sprite_ext(hands2_index,anim_frame,xx + hand_xoffset2,yy + zz + hand_yoffset2,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
							}
						}
						//Bron
						draw_sprite_ext(gun_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);	
		
						//Czapka
						draw_sprite_ext(hat_index,hat_frame,xx,yy + zz - 12 + hatY + 32,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
					
		//----------------------------------------------------------------------------------------------------------------
		break;
		case index_facing.left:
		//----------------------------------------------------------------------------------------------------------------
		
		if (instance_exists(obj_gun_logic)){obj_gun_logic.depth = depth - 1;}
					//Glowa
					draw_sprite_part_ext(head_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
					//Gorne ubranie
					draw_sprite_part_ext(torso_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
					//Spodnie
					draw_sprite_part_ext(legs_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);

					//Buty
					draw_sprite_part_ext(boots_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);	
		
					//Czapka
					draw_sprite_ext(hat_index,hat_frame,xx,yy + zz - 12 + hatY + 32,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
		
					//Rece i dlonie
					if (instance_exists(obj_gun_logic)){
						if (obj_gun_logic.state == gunState.reloading) || (obj_gun_logic.state == gunState.shooting) || (obj_gun_logic.state == gunState.reloading_empty){
							draw_sprite_ext(arms_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
							draw_sprite_ext(hands_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
						}else{
							draw_sprite_ext(arms_index,anim_frame,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
							draw_sprite_ext(hands_index,anim_frame,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
						}
					}
		
					//Bron
					draw_sprite_ext(gun_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);

		//----------------------------------------------------------------------------------------------------------------
		break;
		case index_facing.right:
		//----------------------------------------------------------------------------------------------------------------
		
		if (instance_exists(obj_gun_logic)){obj_gun_logic.depth = depth - 1;}
					//Glowa
					draw_sprite_part_ext(head_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
					//Gorne ubranie
					draw_sprite_part_ext(torso_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
					//Spodnie
					draw_sprite_part_ext(legs_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);

					//Buty
					draw_sprite_part_ext(boots_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);	
					
					//Czapka
					draw_sprite_ext(hat_index,hat_frame,xx,yy + zz - 12 + hatY + 32,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
					
					//Rece i dlonie
					if (instance_exists(obj_gun_logic)){
						if (obj_gun_logic.state == gunState.reloading) || (obj_gun_logic.state == gunState.shooting) || (obj_gun_logic.state == gunState.reloading_empty){
							draw_sprite_ext(arms_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
							draw_sprite_ext(hands_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
						}else{
							draw_sprite_ext(arms_index,anim_frame,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
							draw_sprite_ext(hands_index,anim_frame,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
						}
					}
		
					//Bron
					draw_sprite_ext(gun_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);

		//----------------------------------------------------------------------------------------------------------------
		break;
		case index_facing.up:
		//----------------------------------------------------------------------------------------------------------------
		
		if (instance_exists(obj_gun_logic)){obj_gun_logic.depth = depth + 1;}
					//Rece i dlonie
					if (instance_exists(obj_gun_logic)){
						if (obj_gun_logic.state == gunState.reloading) || (obj_gun_logic.state == gunState.shooting) || (obj_gun_logic.state == gunState.reloading_empty){
							draw_sprite_ext(arms_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
							draw_sprite_ext(hands_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
						}else{
							draw_sprite_ext(arms_index,anim_frame,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
							draw_sprite_ext(hands_index,anim_frame,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
						}
					}
					
					//Bron
					draw_sprite_ext(gun_index,anim_frame_action,xx + hand_xoffset,yy + zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
					//Glowa
					draw_sprite_part_ext(head_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
					//Gorne ubranie
					draw_sprite_part_ext(torso_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);
	
					//Spodnie
					draw_sprite_part_ext(legs_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);

					//Buty
					draw_sprite_part_ext(boots_index,anim_frame,0,sprite_yoffset,sprite_width,sprite_height-zz,xx-sprite_xoffset,yy+zz,image_xscale,image_yscale,c_white,image_alpha);	
					
					//Czapka
					draw_sprite_ext(hat_index,hat_frame,xx,yy + zz - 12 + hatY + 32,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

		//----------------------------------------------------------------------------------------------------------------
		break;
	}
		
}


	

	switch(actionstate){
		case player_state_action.none:
			switch(state){
				case player_state.idle:
					drawPlayerNormal(px, py, pz, false);
				break;
				case player_state.moving:
					drawPlayerNormal(px, py, pz, false);
				break;
				case player_state.wading_idle:
					drawPlayerNormal(px, py, pz + 4, true);
				break;
				case player_state.wading:
					drawPlayerNormal(px, py, pz + 4, true);
				break;
				case player_state.swimming_idle:
					drawPlayerNormal(px, py, pz + 16, true);
				break;
				case player_state.swimming:
					drawPlayerNormal(px, py, pz + 16, true);
				break;
				default:
					drawPlayerNormal(px, py, pz, false);
				break;
			}
		break;
		case player_state_action.eating:
			switch(state){
				case player_state.idle:
					drawPlayerEating(px, py, pz, false);
				break;
				case player_state.moving:
					drawPlayerEating(px, py, pz, false);
				break;
				case player_state.wading_idle:
					drawPlayerEating(px, py, pz + 4, true);
				break;
				case player_state.wading:
					drawPlayerEating(px, py, pz + 4, true);
				break;
				case player_state.swimming_idle:
					drawPlayerEating(px, py, pz + 16, true);
				break;
				case player_state.swimming:
					drawPlayerEating(px, py, pz + 16, true);
				break;
				default:
					drawPlayerEating(px, py, pz, false);
				break;
			}
		break;
		case player_state_action.drinking:
			switch(state){
				case player_state.idle:
					drawPlayerDrinking(px, py, pz, false);
				break;
				case player_state.moving:
					drawPlayerDrinking(px, py, pz, false);
				break;
				case player_state.wading_idle:
					drawPlayerDrinking(px, py, pz + 4, true);
				break;
				case player_state.wading:
					drawPlayerDrinking(px, py, pz + 4, true);
				break;
				case player_state.swimming_idle:
					drawPlayerDrinking(px, py, pz + 16, true);
				break;
				case player_state.swimming:
					drawPlayerDrinking(px, py, pz + 16, true);
				break;
				default:
					drawPlayerDrinking(px, py, pz, false);
				break;
			}
		break;
		case player_state_action.pickup:
			switch(state){
				case player_state.idle:
					drawPlayerPickup(px, py, pz, false);
				break;
				case player_state.moving:
					drawPlayerPickup(px, py, pz, false);
				break;
				case player_state.wading_idle:
					drawPlayerPickup(px, py, pz + 4, true);
				break;
				case player_state.wading:
					drawPlayerPickup(px, py, pz + 4, true);
				break;
				case player_state.swimming_idle:
					drawPlayerPickup(px, py, pz + 16, true);
				break;
				case player_state.swimming:
					drawPlayerPickup(px, py, pz + 16, true);
				break;
				default:
					drawPlayerPickup(px, py, pz, false);
				break;
			}
		break;
		case player_state_action.attacking_melee:
			switch(state){
				case player_state.idle:
					drawPlayerMelee(px, py, pz, false);
				break;
				case player_state.moving:
					drawPlayerMelee(px, py, pz, false);
				break;
				case player_state.wading_idle:
					drawPlayerMelee(px, py, pz + 4, true);
				break;
				case player_state.wading:
					drawPlayerMelee(px, py, pz + 4, true);
				break;
				case player_state.swimming_idle:
					drawPlayerMelee(px, py, pz + 16, true);
				break;
				case player_state.swimming:
					drawPlayerMelee(px, py, pz + 16, true);
				break;
				default:
					drawPlayerMelee(px, py, pz, false);
				break;
			}
		break;
		case player_state_action.handgun:
		
			switch(state){
				case player_state.idle:
					drawPlayerHandgun(px, py, pz, false);
				break;
				case player_state.moving:
					drawPlayerHandgun(px, py, pz, false);
				break;
				case player_state.wading_idle:
					drawPlayerHandgun(px, py, pz + 4, true);
				break;
				case player_state.wading:
					drawPlayerHandgun(px, py, pz + 4, true);
				break;
				case player_state.swimming_idle:
					drawPlayerHandgun(px, py, pz + 16, true);
				break;
				case player_state.swimming:
					drawPlayerHandgun(px, py, pz + 16, true);
				break;
				default:
					drawPlayerHandgun(px, py, pz, false);
				break;
			}
			
		break;
	}
}
