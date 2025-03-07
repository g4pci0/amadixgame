function scr_playerMovingAnim() {

	
with(obj_amadix){
	
	if (!global.pause){
		switch (actionstate){
			case player_state_action.none:
					anim_frame += anim_speed;
					if anim_frame > anim_frame_num{
						anim_frame = 0;
					}
			break;
			case player_state_action.eating:
					anim_frame_action += anim_speed_action;
					if anim_frame_action > (anim_frame_action_num + .9){
						anim_frame_action = anim_frame_action_num;
					}
			break;
			case player_state_action.drinking:
					anim_frame_action += anim_speed_action;
					if anim_frame_action > (anim_frame_action_num + .9){
						anim_frame_action = anim_frame_action_num;
					}
			break;
			case player_state_action.attacking_melee:
					anim_frame_action += anim_speed_action;
					if anim_frame_action > (anim_frame_action_num + .9){
						anim_frame_action = anim_frame_action_num;
					}
			break;
			case player_state_action.pickup:
				
					if (pickupTrigger){
						anim_speed_action = -0.2;
						if (anim_frame_action <= 0){
							anim_frame_action = 0;	
						}
					}else{
						anim_speed_action = 0.2;
					}
				
					anim_frame_action += anim_speed_action;
				
					if anim_frame_action > (2.7){
						pickupTrigger = true;
					}
				
			break;
			case player_state_action.handgun:
					anim_frame += anim_speed;
					if anim_frame > anim_frame_num{
						anim_frame = 0;
					}
			
					//Update facing
					if (running != 2){
						if isLooking(index_facing.up){
							facing = index_facing.up;	
							scr_updatePlayerAnim();
						}else
						if isLooking(index_facing.left){
							facing = index_facing.left;	
							scr_updatePlayerAnim();
						}else
						if isLooking(index_facing.down){
							facing = index_facing.down;	
							scr_updatePlayerAnim();
						}else{
							facing = index_facing.right;	
							scr_updatePlayerAnim();
						}
					}
		
					//Gun animation
					if (instance_exists(obj_gun_logic)){
						switch(obj_gun_logic.state){
							case gunState.standby:
								anim_frame_action = anim_frame;
							break;
							case gunState.shooting:
								anim_speed_action = 0.5;
								if (obj_gun_logic.ammoLoaded <= 0.9){
									anim_frame_action_num = obj_gun_logic.animFramesShootingLast;
								}else{
									anim_frame_action_num = obj_gun_logic.animFramesShooting;	
								}
								anim_frame_action += anim_speed_action;	
								if anim_frame_action >= (anim_frame_action_num + .9){
									anim_frame_action = anim_frame_action_num + .9;
									anim_speed_action = 0;
								}
							break;
							case gunState.reloading:
								anim_frame_action_num = obj_gun_logic.animFramesReload;
								anim_speed_action = (anim_frame_action_num + 1) / obj_gun_logic.reloadTime;
								anim_frame_action += anim_speed_action;
								if anim_frame_action >= (anim_frame_action_num + .9){
									anim_frame_action = anim_frame_action_num + .9;
									anim_speed_action = 0;
								}
							break;
							case gunState.reloading_empty:
								anim_frame_action_num = obj_gun_logic.animFramesReloadEmpty;
								anim_speed_action = (anim_frame_action_num + 1) / obj_gun_logic.reloadTimeEmpty;
								anim_frame_action += anim_speed_action;
								if anim_frame_action >= (anim_frame_action_num + .9){
									anim_frame_action = anim_frame_action_num + .9;
									anim_speed_action = 0;
								}
							break;
							case gunState.empty:
								anim_frame_action = anim_frame;
							break;
						}
					}
			
			
			break;
		}
	}
	
	
	if (instance_exists(obj_gun_logic)){
		if (running != 2){
			if (obj_gun_logic.state != gunState.reloading)
			&& (obj_gun_logic.state != gunState.reloading_empty){
				shootdir = (point_direction(x, y + 16, mouse_x, mouse_y));
			}else{
				shootdir = facing * 90;
			}
		}else{
			shootdir = facing;	
		}
	}
	
/*
	switch(facing){
		case index_facing.down:
			 hand_xoffset = -3;
			 hand_yoffset = 14;
			 hand_xoffset2 = 3;
			 hand_yoffset2 = 14;
			if (isbounded(mouse_x, x - 6, x + 6) && isbounded(mouse_y, y + 6, y + 14)){
				 hand_rot = 0;
			}else{
				 hand_rot = point_direction(x, y + hand_yoffset, mouse_x, mouse_y) + 90;
			}
		break;
		case index_facing.left:
			 hand_xoffset = 3;
			 hand_yoffset = 17;
			 hand_rot = point_direction(x, y + hand_yoffset, mouse_x, mouse_y) - 180;
		break;
		case index_facing.right:
			 hand_xoffset = -3;
			 hand_yoffset = 17;
			 hand_rot = point_direction(x, y  + hand_yoffset, mouse_x, mouse_y);
		break;
		case index_facing.up:
			 hand_xoffset = 0;
			 hand_yoffset = 18;
			 hand_rot = point_direction(x, y  + hand_yoffset, mouse_x, mouse_y) - 90;
		break;
	}
*/



	if obj_gamecontrol.doTransition == false{
		if ((hsp == 0) && (vsp == 0)){
			scr_setPlayerFacing();
			if (state != player_state.swimming_idle){
				anim_speed = 0;
			}else{
				anim_speed = 0.02;
			}
		}
	}

	//var slippery = collision_rectangle(bbox_left + 4, bbox_bottom, bbox_right - 4, bbox_bottom, obj_ice16, false, true);
	if (canmove){
		if (!moving){
			if (movingfix){
				//anim_frame = 1;
				movingfix = false;
			}else{
				//anim_frame = 0;
			}
			//anim_speed = 0;
		}else{
			movingfix = true;
		}

		if (((key_right) || (key_left) || (key_up) || (key_down)) && (!collision_rectangle(bbox_left - 1, bbox_top - 1, bbox_right + 1, bbox_bottom + 1, par_collision, false, true))){
			if !(anim_fix){
				anim_frame = 1;
				anim_fix = true;
			}
		}
		
		if (running == 2) && ((!scr_playerPressingKeys()) || ((abs(hsp) < .3) && (abs(vsp) < .3)) ){
			if ((hsp != 0) || (vsp != 0)){
				if (timeSinceRunning >= timeToRun){
					if (actionstate != player_state_action.attacking_melee)
					&& (actionstate != player_state_action.handgun)
					&& (state != player_state.wading)
					&& (state != player_state.wading_idle)
					&& (state != player_state.swimming)
					&& (state != player_state.swimming_idle){
						skid = true;
					}
				}
			}
		}
	}
	if ((hsp == 0) && (vsp == 0)){
		if ((floor(anim_frame) == 0) || (floor(anim_frame) == 2)){
			if (state != player_state.swimming_idle){
				anim_speed = 0;
			}else{
				anim_speed = 0.02;
			}
			if (!skid){
				if (state != player_state.swimming_idle){
					anim_speed = 0;
					anim_frame = 0;
				}else{
					anim_speed = 0.02;
				}
				scr_setPlayerFacing();
			}
		}
	}
	/*
	if (!scr_playerPressingKeys()){
		anim_speed = 0;
		if (!running){
			anim_frame = 0;	
		}
		anim_fix = false;
		scr_setPlayerFacing();
	}
	
	//Naprawa animacji biegania
	if (key_run){
		if (runningfix) && (moving){
			anim_frame = 1;
			anim_speed = 0;
			runningfix = false;
		}
	}else{
		runningfix = true;	
	}
	*/
	/*
	if (running) && ( (abs(hsp) < .1) && (abs(vsp) < .1) ){
		running = false;
	}
	*/
	/*
	if ( (abs(hsp) < .05) && (abs(vsp) < .05) ){
		anim_speed = 0;
		anim_frame = 0;
	}
	*/
	
	// Shadows
	if (state == player_state.wading) 
	|| (state == player_state.swimming) 
	|| (state == player_state.swimming_idle) 
	|| (state == player_state.wading_idle)
	|| (!visible){
		shadowEnable = false;
	}else{
		shadowEnable = true;	
	}
	
	if (state == player_state.swimming_idle){
		
		anim_frame_num = 2;
		
	}else if (state == player_state.swimming){
		
		anim_frame_num = 6;
		
	}else{
		if (canmove){
			if (running){
				anim_frame_num = 12;	
			}else{
				anim_frame_num = 4;	
			}
		}
	}
	
	if (running == 2){
		if (timeSinceRunning >= timeToRun){
			timeSinceRunning = timeToRun;
		}else{
			timeSinceRunning++;
		}
	}else{
		timeSinceRunning = lerp(timeSinceRunning, 0, .2);
	}
	
	if (skid) && (canmove){
		if (skidTimer <= 0){
			skidTimer = skidTime;
			skid = false;
			//scr_setPlayerFacing();
			//anim_frame = 0;
		}else{
			skidTimer--;
		}
	}
	
	if ( (abs(hsp) < .1) && (abs(vsp) < .1) ){
		if (!skid){
			if (state != player_state.swimming_idle){
				anim_speed = 0;
			}else{
				anim_speed = 0.02;
			}
		}
		if (running == 1){
			if (!skid)
				anim_frame = 0;
			running = 0;
		}
	}
	
	if (canmove)
	&& (actionstate != player_state_action.attacking_melee)
	&& (actionstate != player_state_action.drinking)
	&& (actionstate != player_state_action.eating)
	&& (actionstate != player_state_action.pickup){
		if (actionstate == player_state_action.handgun)
		&& (running == 2){
				if (key_right){ 
					scr_setPlayerFacingAnim(index_facing.right);
					facing = index_facing.right;
					hand_rot = 0;
				}
				if (key_left){
					scr_setPlayerFacingAnim(index_facing.left);
					facing = index_facing.left;
					hand_rot = 0;
				}
				if (key_up){
					scr_setPlayerFacingAnim(index_facing.up);
					facing = index_facing.up;
					hand_rot = 0;
				}
				if (key_down){
					scr_setPlayerFacingAnim(index_facing.down);
					facing = index_facing.down;
					hand_rot = 360;
				}	
		}
		if (actionstate == player_state_action.none){
				if (key_right){ 
					scr_setPlayerFacingAnim(index_facing.right);
					facing = index_facing.right;
				}
				if (key_left){
					scr_setPlayerFacingAnim(index_facing.left);
					facing = index_facing.left;
				}
				if (key_up){
					scr_setPlayerFacingAnim(index_facing.up);
					facing = index_facing.up;
				}
				if (key_down){
					scr_setPlayerFacingAnim(index_facing.down);
					facing = index_facing.down;
				}	
		}
	}
	
	if (skid){
		
		
		anim_speed = 0;	
		anim_frame_num = 0;
		switch(facing){
			case index_facing.down:
				anim_frame = 0;
				facing = index_facing.down;
				scr_setPlayerFacingAnim(index_facing.down);
			break;
			case index_facing.left:
				anim_frame = 0;
				facing = index_facing.left;
				scr_setPlayerFacingAnim(index_facing.left);
			break;
			case index_facing.right:
				anim_frame = 1;
				facing = index_facing.right;
				scr_setPlayerFacingAnim(index_facing.right);
			break;
			case index_facing.up:
				anim_frame = 2;
				facing = index_facing.up;
				scr_setPlayerFacingAnim(index_facing.up);
			break;
		}
		
	}
	
}
}
