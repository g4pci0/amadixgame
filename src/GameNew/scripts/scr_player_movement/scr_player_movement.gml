function scr_player_movement() {
	
with (obj_amadix){
	//------------------------------------------------------
	key_right =     input_check("right");
	key_left =      input_check("left");
	key_up =        input_check("up");
	key_down =      input_check("down");
	key_run =       input_check("run");
	key_sneak =		input_check("sneak");
	//------------------------------------------------------



	
	var ice_collision = collision_rectangle(bbox_left + 4, bbox_bottom, bbox_right - 4, bbox_bottom, obj_ice16, false, true);
	
	// Czy moze sie poruszac
	
	if (actionstate == player_state_action.eating)
	|| (actionstate == player_state_action.drinking)
	|| (actionstate == player_state_action.pickup)
	|| (global.inDialogue)
	|| (global.inConsole)
	|| (global.inEq)
	|| (global.inCutscene)
	|| (global.inChest)
	|| (global.pause)
	|| (global.inChestAnim){
		if (global.pause){
			hsp = 0;
			vsp = 0;
		}else{
			if (hsp != 0){
				hsp = lerp(hsp, 0, 0.5);
			}
			if (vsp != 0){
				vsp = lerp(vsp, 0, 0.5);
			}
		}
		anim_frame = 0;
		anim_speed = 0;
		canmove = false;
	}else{
		canmove = true;
	}
	
	if (isbounded(skidTimer, 0, skidTime - 1)){
		if (actionstate != player_state_action.attacking_melee)
		&& (state != player_state.wading)
		&& (state != player_state.wading_idle)
		&& (state != player_state.swimming)
		&& (state != player_state.swimming_idle){
			canmove = true;
			if (hsp != 0){
				hsp = lerp(hsp, 0, 0.15);
			}
			if (vsp != 0){
				vsp = lerp(vsp, 0, 0.15);
			}
		}
	}
	

	
	//Ustawia predkosc
	var _spd = round_to2(speedEffect + speedChange);
	
	//if (key_run) && (moving){
	//	if (spd >= (runspeed + _spd) - 0.3){
	//		if ((round(anim_frame) == 0) || (round(anim_frame) == 2)){
	//			running = 2;	
	//		}
	//	}else{
	//		running = 1;
	//	}
	//}else{
	//	running = 0;
	//}
	
	if (key_run) && (running == 2){
		running = 2;	
	}
	
	if (spd > max_spd){
		spd = max_spd;	
	}
	
	if ((key_run) && (key_sneak)){
		running = 0;	
	}
	
	switch (state) {
		case player_state.moving:
		case player_state.idle:
					if (!ice_collision){
						if (running == 0){
								max_spd = walkspeed + _spd;
								spd = walkspeed + _spd;
								anim_speed = 0.09;
								accel = 0.6;
								deccel = 0.35;
								
								runningTimer = timeToRun;
								
								if (key_run){
									running = 1;
								}else{
									running = 0;	
								}
								
						}else if (running == 1){
								max_spd = runspeed + _spd;
								spd = lerp(spd, (runspeed + _spd), 0.1);
								anim_speed = lerp(anim_speed, 0.15, 0.05);
								
								accel = 0.3;
								deccel = 0.3;
							
								
								if (!key_run){
									running = 0;	
								}else{
									if (runningTimer <= 0){
										if ((round(anim_frame) == 0) || (round(anim_frame) == 2)){
											runningTimer = 0;
										}
									}else{
										runningTimer--;	
									}
									
									if (runningTimer == 0){
										if (!skid)
											anim_frame = 0;
										running = 2;	
									}
								}
								
						}else{
								max_spd = runspeed + _spd;
								spd = runspeed + _spd;
								anim_speed = 0.3;
								accel = 0.3;
								deccel = 0.25;
								
								runningTimer = timeToRun;
								
								if (!key_run){
									running = 0;	
								}else{
									running = 2;	
								}
						}

					}else{
						
						accel = 0.04;
						deccel = 0.04;
							if (running == 0){
								spd = runspeed + _spd;
								anim_speed = 0.18;
							}else if (running == 1){
								spd = walkspeed + _spd;
								anim_speed = 0.15;
							}else{
								spd = walkspeed + _spd;
								anim_speed = 0.15;
							}

					}
		break;
		case player_state.wading_idle:
						if (running == 0){
								max_spd = walkspeed + _spd;
								spd = walkspeed + _spd;
								anim_speed = 0.09;
								accel = 0.6;
								deccel = 0.35;
								
								runningTimer = timeToRun;
								
								if (key_run){
									running = 1;
								}else{
									running = 0;	
								}
								
						}else if (running == 1){
								max_spd = runspeed + _spd;
								spd = lerp(spd, (runspeed + _spd), 0.1);
								anim_speed = lerp(anim_speed, 0.15, 0.05);
								
								accel = 0.3;
								deccel = 0.3;
							
								
								if (!key_run){
									running = 0;	
								}else{
									if (runningTimer <= 0){
										if ((round(anim_frame) == 0) || (round(anim_frame) == 2)){
											runningTimer = 0;
										}
									}else{
										runningTimer--;	
									}
									
									if (runningTimer == 0){
										anim_frame = 0;
										running = 2;	
									}
								}
								
						}else{
								max_spd = runspeed + _spd;
								spd = runspeed + _spd;
								anim_speed = 0.3;
								accel = 0.3;
								deccel = 0.25;
								
								runningTimer = timeToRun;
								
								if (!key_run){
									running = 0;	
								}else{
									running = 2;	
								}
						}
					//if (running){
					//	spd = runspeed + _spd;
					//	anim_speed = 0.16;
					//}else{
					//	spd = walkspeed + _spd;
					//	anim_speed = 0.12;
					//}
		break;
		case player_state.swimming_idle:
						if (running == 0){
								max_spd = walkspeed + _spd;
								spd = walkspeed + _spd;
								accel = 0.6;
								deccel = 0.35;
								
								runningTimer = timeToRun;
								
								if (key_run){
									running = 1;
								}else{
									running = 0;	
								}
								
						}else if (running == 1){
								max_spd = runspeed + _spd;
								spd = lerp(spd, (runspeed + _spd), 0.1);
								
								accel = 0.3;
								deccel = 0.3;
							
								
								if (!key_run){
									running = 0;	
								}else{
									if (runningTimer <= 0){
										if ((round(anim_frame) == 0) || (round(anim_frame) == 2)){
											runningTimer = 0;
										}
									}else{
										runningTimer--;	
									}
									
									if (runningTimer == 0){
										anim_frame = 0;
										running = 2;	
									}
								}
								
						}else{
								max_spd = runspeed + _spd;
								spd = runspeed + _spd;
								accel = 0.3;
								deccel = 0.25;
								
								runningTimer = timeToRun;
								
								if (!key_run){
									running = 0;	
								}else{
									running = 2;	
								}
						}
					//if (running){
					//	spd = runspeed + _spd;
					//	anim_speed = 0.16;
					//}else{
					//	spd = walkspeed + _spd;
					//	anim_speed = 0.12;
					//}
		break;
		case player_state.wading:
						if (running == 0){
								max_spd = walkspeed - 0.35 + _spd;
								spd = walkspeed - 0.35 + _spd;
								anim_speed = 0.08;
								accel = 0.2;
								deccel = 0.6;
								
								runningTimer = timeToRun;
								
								if (key_run){
									running = 1;
								}else{
									running = 0;	
								}
								
						}else if (running == 1){
								max_spd = runspeed - 0.35 + _spd;
								spd = lerp(spd, (runspeed - 0.35 + _spd), 0.1);
								anim_speed = lerp(anim_speed, 0.08, 0.05);
								
								accel = 0.2;
								deccel = 0.6;
								
								if (!key_run){
									running = 0;	
								}else{
									if (runningTimer <= 0){
										if ((round(anim_frame) == 0) || (round(anim_frame) == 2)){
											runningTimer = 0;
										}
									}else{
										runningTimer--;	
									}
									
									if (runningTimer == 0){
										anim_frame = 0;
										running = 2;	
									}
								}
								
						}else{
								max_spd = runspeed - 0.35 + _spd;
								spd = runspeed - 0.35 + _spd;
								anim_speed = 0.1;
								accel = 0.2;
								deccel = 0.6;
								
								runningTimer = timeToRun;
								
								if (!key_run){
									running = 0;	
								}else{
									running = 2;	
								}
						}
					//if (running){
					//	spd = runspeed - 0.35 + _spd;
					//	anim_speed = 0.1;
					//}else{
					//	spd = walkspeed - 0.3 + _spd;
					//	anim_speed = 0.08;
					//}
	
					//accel = 0.2;
					//deccel = 0.6;
		break;
		case player_state.swimming:
						if (running == 0){
								max_spd = walkspeed - 0.5 + _spd;
								spd = walkspeed - 0.5 + _spd;
								anim_speed = 0.09;
								accel = 0.15;
								deccel = 0.2;
								
								runningTimer = timeToRun;
								
								if (key_run){
									running = 1;
								}else{
									running = 0;	
								}
								
						}else if (running == 1){
								max_spd = walkspeed - 0.5 + _spd;
								spd = lerp(spd, (runspeed - 0.5 + _spd), 0.05);
								anim_speed = lerp(anim_speed, 0.15, 0.15);
								
								accel = 0.15;
								deccel = 0.2;
							
								
								if (!key_run){
									running = 0;	
								}else{
									if (runningTimer <= 0){
										if ((round(anim_frame) == 0) || (round(anim_frame) == 2)){
											runningTimer = 0;
										}
									}else{
										runningTimer--;	
									}
									
									if (runningTimer == 0){
										anim_frame = 0;
										running = 2;	
									}
								}
								
						}else{
								max_spd = runspeed - 0.55 + _spd;
								spd = runspeed - 0.55 + _spd;
								anim_speed = 0.15;
								accel = 0.15;
								deccel = 0.2;
								
								runningTimer = timeToRun;
								
								if (!key_run){
									running = 0;	
								}else{
									running = 2;	
								}
						}
					//if (running){
					//	spd = runspeed - 0.55 + _spd;
					//	anim_speed = 0.08;
					//}else{
					//	spd = walkspeed - 0.5 + _spd;
					//	anim_speed = 0.05;
					//}
	
					//accel = 0.15;
					//deccel = 0.2;
		break;
	}

	if (!key_run){
		running = 0;	
	}
	
	if (key_sneak) && !( (hsp == 0) && (vsp == 0) ){
		spd /= 1.5;	
	}
	
	if (running == 2) && (!moving){
		running = 0;	
	}

	if (canmove){
		//Dzialanie klawiszy
		hor_keyPress = key_right - key_left;
		ver_keyPress = key_down - key_up;


		//Ustawia plynne zmienne hsp i vsp
		if (scr_playerPressingKeys()){
			hsp = lerp(hsp, spd*hor_keyPress, accel);
			vsp = lerp(vsp, spd*ver_keyPress, accel);
			
			clamp(hsp, .35, 3);
			clamp(vsp, .35, 3);
		}else{
			hsp = lerp(hsp, 0, deccel);
			vsp = lerp(vsp, 0, deccel);
		}
	}else{
		hor_keyPress = 0;
		ver_keyPress = 0;	
	}
	
	if (abs(hsp) < 0.001){
		hsp = 0;	
	}
	if (abs(vsp) < 0.001){
		vsp = 0;	
	}
	
	if (hsp == 0) && (vsp == 0){
		switch(facing){
			case index_facing.down: 
				dir = 270;
			break;
			case index_facing.left: 
				dir = 180;
			break;
			case index_facing.right: 
				dir = 0;
			break;
			case index_facing.up: 
				dir = 90;
			break;
		}
	}else{
		dir = point_direction(x, y, x + hsp, y + vsp);
	}
	
	//Naprawa poruszania sie po przekatnej
	var diagonal = hor_keyPress != 0 && ver_keyPress != 0;
	if (diagonal) && (!ice_collision){
		if (state == player_state.wading)
		|| (state == player_state.wading_idle)
		|| (state == player_state.swimming)
		|| (state == player_state.swimming_idle){
			if (running == 0){
				hsp *= 0.9;
				vsp *= 0.9;
				//anim_speed *= 0.8;	
			}else{
				hsp *= 0.9;
				vsp *= 0.9;
				//anim_speed *= 0.95;	
			}
		}else{
			if (running == 0){
				hsp *= 0.8;
				vsp *= 0.8;
				anim_speed *= 0.8;	
			}else{
				hsp *= 0.9;
				vsp *= 0.9;
				//anim_speed *= 0.95;	
			}
		}


	}
	
	if (actionstate == player_state_action.attacking_melee){
		running = 0;
		skid = false;
		skidTimer = skidTime;
		hsp /= 4;
		vsp /= 4;
	}
	
	var plantcol = collision_rectangle(bbox_left, bbox_top + 4, bbox_right, bbox_bottom + 4, par_collectible, false, true);
	var plantcol2 = collision_rectangle(bbox_left, bbox_top + 4, bbox_right, bbox_bottom + 4, par_grass, false, true);
	
	if (plantcol) || (plantcol2){
		speedChange = -.2;
	}else{
		speedChange = 0;	
	}
	

	//Kolizje
	//-----------------------------------------------------------------------------
	/*
	if (hsp != 0){
		var hor_collision = instance_place(x + hsp, y, par_collision);
		    if ((hor_collision != noone) && (hor_collision.cancollide)){
		        repeat(abs(hsp)){
		            if(!place_meeting(x + sign(hsp), y, par_collision)){x += sign(hsp);}
		            else{ break; }
		        }
		        hsp = 0;
		    }
	}
	if canmove == true{
		x += hsp;
	}

	if (vsp != 0){
		var ver_collision = instance_place(x, y + vsp, par_collision);
		    if ((ver_collision != noone) && (ver_collision.cancollide)){
		        repeat(abs(vsp)){
				
		            if(!place_meeting(x, y + sign(vsp), par_collision)){y += sign(vsp);}
		            else{ break; }
		        }
		        vsp = 0;
		    }
	}
	if canmove == true{
	    y += vsp;
	}
	*/
	//-----------------------------------------------------------------------------

	//Ustawia zmienna "state"
	var shallow_collision = collision_rectangle(bbox_left + 4, bbox_bottom - 1, bbox_right - 4, bbox_bottom, obj_shallowwater16, true, true);
	var deep_collision = collision_rectangle(bbox_left + 4, bbox_bottom - 1, bbox_right - 4, bbox_bottom, obj_water16, true, true);

	if (shallow_collision){
		if (moving){
			state = player_state.wading;
		}else{
			state = player_state.wading_idle;
		}
	
	}else if (deep_collision){
		if (moving){
			state = player_state.swimming;
		}else{
			state = player_state.swimming_idle;
		}
		
	}else{
		if (moving){
			state = player_state.moving;
		}else{
			state = player_state.idle;
		}
	}

	//Kolizje TESTOWE
	//-----------------------------------------------------------------------------
	
	



	
	//var slope_collision = instance_place(x + hsp, y + vsp, par_slope);
	

	/*
	if ((slope_collision != noone) && (slope_collision.cancollide == true)){
		scr_player_movement_slope();
	}
	*/
	/*
	if (hsp != 0){
		if ((instance_place(x + 1, y, par_slope)) && (!instance_place(x + 1, y - 1, par_slope))){
				if !((key_right) && (key_down)){
						if (key_right){
							hsp = slope_spd;
							vsp = -slope_spd;
						}
						if (key_down){
							hsp = -slope_spd;
							vsp = slope_spd;
						}
				}
		}
	}
	*/
	/*
	
	if (hor_collision){
		if ((hor_collision != noone) && (hor_collision.cancollide)){
		    var yplus = 0;
		
		    while (place_meeting(x + hsp, y - yplus, par_collision) && yplus <= abs(1 * hsp))
			yplus += 1;
		
		    if place_meeting(x + hsp, y - yplus, par_collision){
		        while (!place_meeting(x + sign(hsp), y, par_collision)) x += sign(hsp);
		        hsp = 0;
		    }else{
		        y -= yplus;
		    }
		}
	}
	x += hsp;
	
	if (ver_collision){
		if ((ver_collision != noone) && (ver_collision.cancollide)){
		    var xplus = 0;
		
		    while (place_meeting(x - xplus, y + vsp, par_collision) && xplus <= abs(1 * vsp))
			xplus += 1;
		
		    if place_meeting(x + xplus, y + vsp, par_collision){
		        while (!place_meeting(x, y + sign(vsp), par_collision)) y += sign(vsp);
		        vsp = 0;
		    }else{
		        x += xplus;
		    }
		}
	}
	y += vsp;
*/
	/*
	var hor_list = ds_list_create();
	var hor_collision = instance_place_list(x + hsp, y, par_collision, hor_list, false);
	
	var inst = noone;
	
	var __i = 0;
	repeat(hor_collision - 1){
		if (hor_list[| __i].cancollide == false){
			ds_list_delete(hor_list, __i);
			inst = hor_list[| __i];
		}
		__i++;
	}
	
	var ver_collision = instance_place(x, y + vsp, par_collision);
	*/
	
	scr_player_unstuck();
	
	var hor_collision = instance_place(x + hsp, y, par_collision);
	var ver_collision = instance_place(x, y + vsp, par_collision);
	
	var hor_list = ds_list_create();
	var hor_num = instance_place_list(x + hsp, y, par_collision, hor_list, false);
	
	if (hor_num != noone){
		var __i = 0;
		repeat(hor_num){
			if (variable_instance_exists(hor_list[| __i], "cancollide")){
								var yplus = 0;

								//can we go above?
								while (instance_place_3d(x + hsp, y - yplus, zaxis, par_collision) && yplus <= abs(hsp)) yplus += 1;
								if ((!instance_place_3d(x + hsp, y - yplus, zaxis, par_collision)) && (!key_down)) {
									//if you can go up, then go up
									y -= yplus;
								} else {
									//we can't go above it   
									//can we go below?
									while (instance_place_3d(x + hsp, y + yplus, zaxis, par_collision) && yplus <= abs(hsp)) yplus += 1;
									if ((!instance_place_3d(x + hsp, y + yplus, zaxis, par_collision)) && (!key_up)) {
									    //if we can go down, then we'll go down
									    y += yplus;
									} else {
									    //we can't go below it
									    //we get as close as we can to the wall and stop
									    while (!instance_place_3d(x + sign(hsp), y, zaxis, par_collision))
									        x += sign(hsp);
									    hsp = 0;
									}
								}
			}
			__i++;
		}
		ds_list_destroy(hor_list);
	}

/*
	//if the colision is horizontal   
	if (hor_collision) {
		if ((hor_collision != noone) && (hor_collision.cancollide)){
		    var yplus = 0;

		    //can we go above?
		    while (instance_place(x + hsp, y - yplus, par_collision) && yplus <= abs(hsp)) yplus += 1;
		    if ((!instance_place(x + hsp, y - yplus, par_collision)) && (!key_down)) {
		        //if you can go up, then go up
		        y -= yplus;
		    } else {
		        //we can't go above it   
		        //can we go below?
		        while (instance_place(x + hsp, y + yplus, par_collision) && yplus <= abs(hsp)) yplus += 1;
		        if ((!instance_place(x + hsp, y + yplus, par_collision)) && (!key_up)) {
		            //if we can go down, then we'll go down
		            y += yplus;
		        } else {
		            //we can't go below it
		            //we get as close as we can to the wall and stop
		            while (!instance_place(x + sign(hsp), y, par_collision))
		                x += sign(hsp);
		            hsp = 0;
		        }
		    }
		}
	}
*/
	x += hsp;	


	var ver_list = ds_list_create();
	var ver_num = instance_place_list(x, y + vsp, par_collision, ver_list, false);
	
	if (ver_num != noone){
		var __i = 0;
		repeat(ver_num){
			if (variable_instance_exists(ver_list[| __i], "cancollide")){
				if (ver_list[| __i].cancollide == true){
								var xplus = 0;

								//can we go to the left?
								while (instance_place_3d(x - xplus, y + vsp, zaxis, par_collision) && xplus <= abs(vsp)) xplus += 1;
								if ((!instance_place_3d(x - xplus, y + vsp, zaxis, par_collision)) && (!key_right)) {
								    //if you can go to the left, then go to the left
								    x -= xplus;
								} else {
								    //we can't go to the left   
								    //can we go to the right?
								    while (instance_place_3d(x + xplus, y + vsp, zaxis, par_collision) && xplus <= abs(vsp)) xplus += 1;
								    if ((!instance_place_3d(x + xplus, y + vsp, zaxis, par_collision)) && (!key_left)) {
								        //if we can go to the right, then we'll go right
								        x += xplus;
								    } else {
								        //we can't go right
								        //we get as close as we can to the wall and stop
								        while (!instance_place_3d(x, y + sign(vsp), zaxis, par_collision))
								            y += sign(vsp);
								        vsp = 0;
								    }
								}
				}
			}
			__i++;
		}
		ds_list_destroy(ver_list);
	}

	//if the colision is vertical  
	/*
	if (ver_collision) {
		if ((ver_collision != noone) && (ver_collision.cancollide)){
			var xplus = 0;

		    //can we go to the left?
		    while (instance_place(x - xplus, y + vsp, par_collision) && xplus <= abs(vsp)) xplus += 1;
		    if ((!instance_place(x - xplus, y + vsp, par_collision)) && (!key_right)) {
		        //if you can go to the left, then go to the left
		        x -= xplus;
		    } else {
		        //we can't go to the left   
		        //can we go to the right?
		        while (instance_place(x + xplus, y + vsp, par_collision) && xplus <= abs(vsp)) xplus += 1;
		        if ((!instance_place(x + xplus, y + vsp, par_collision)) && (!key_left)) {
		            //if we can go to the right, then we'll go right
		            x += xplus;
		        } else {
		            //we can't go right
		            //we get as close as we can to the wall and stop
		            while (!instance_place(x, y + sign(vsp), par_collision))
		                y += sign(vsp);
		            vsp = 0;
		        }
		    }	
		}
	}
*/
	y += vsp;	
	
	//if (zsp < 10){
	//	zsp += gravSpeed;	
	//}


	
	//var z_collision = instance_place_3d(x, y, zaxis + zsp, par_collision);
	
	//if (z_collision){
	//	if ((z_collision != noone) && (z_collision.cancollide)){
	//		zsp = 0;
	//	}
	//}
	
	
	
	//if (zaxis + zsp > zfloor){
	//	zsp = 0;
	//	zaxis = zfloor;
	//}
	
	//zaxis += zsp;
	
	scr_player_unstuck();
	scr_player_walkaround();
	scr_player_pushout();
	
	
	
	


/*
	if (hsp != 0){
		    if ((hor_collision != noone) && (hor_collision.cancollide)){
		        repeat(abs(hsp)){
		            if(!place_meeting(x + sign(hsp), y, par_collision)){x += sign(hsp);}
		            else{ break; }
		        }
		        hsp = 0;
		    }
	}
	
	x += hsp;
	if (vsp != 0){
		    if ((ver_collision != noone) && (ver_collision.cancollide)){
		        repeat(abs(vsp)){
				
		            if(!place_meeting(x, y + sign(vsp), par_collision)){y += sign(vsp);}
		            else{ break; }
		        }
		        vsp = 0;
		    }
	}
	y += vsp;

*/

/*
	if (hsp != 0){
		var yplus = 0;
		    if ((hor_collision != noone) && (hor_collision.cancollide)){
				while (place_meeting(x + hsp, y - yplus, par_collision) && yplus <= abs(1*hsp)) {yplus += 1;}
				if (place_meeting(x + hsp, y - yplus, par_collision)){
					while !(place_meeting(x + sign(hsp), y, par_collision)){x += sign(hsp)}
					hsp = 0;
				}else{
					y -= yplus;	
				}
		    }
	}
	if canmove == true{
		x += hsp;
	}

	if (vsp != 0){
		var xplus = 0;
		    if ((ver_collision != noone) && (ver_collision.cancollide)){
				while (place_meeting(x - xplus, y + vsp, par_collision) && xplus <= abs(1*vsp)) {xplus += 1;}
				if (place_meeting(x - xplus, y + vsp, par_collision)){
					while !(place_meeting(x, y + sign(vsp), par_collision)){y += sign(vsp)}
					vsp = 0;
				}else{
					x -= xplus;	
				}
		    }
	}
	if canmove == true{
		y += vsp;
	}*/
	
	
	//var move_dist = point_distance(0, 0, hor_keyPress, ver_keyPress);
	//var move_dir = point_direction(0, 0, hor_keyPress, ver_keyPress);
	


	/*if ((hor_collision != noone) && (hor_collision.cancollide)){
		if (place_meeting(x + sign(hsp), y, par_collision) && place_meeting(x + sign(hsp), y - 1, par_collision) && !place_meeting(x + sign(hsp), y - 2, par_collision)){
	        y -= 1;
		}
	    else if (place_meeting(x + sign(hsp), y, par_collision) && !place_meeting(x + sign(hsp), y - 1, par_collision)){
	        --y;
		}
	}
	if ((ver_collision != noone) && (ver_collision.cancollide)){
		if (place_meeting(x + sign(hsp), y, par_collision) && place_meeting(x + sign(hsp), y - 1, par_collision) && !place_meeting(x + sign(hsp), y - 2, par_collision)){
	        y -= 1;
		}
	    else if (place_meeting(x + sign(hsp), y, par_collision) && !place_meeting(x + sign(hsp), y - 1, par_collision)){
	        --y;
		}
	}*/

	

	//-----------------------------------------------------------------------------


	//Ustawia zmienna moving
	if ((round_ext(hsp, 0.1) != 0) || (round_ext(vsp, 0.1) != 0)){moving = true;}else{moving = false;}

	//Animacja gracza
	scr_playerMovingAnim();

	/*
	//Blokuje wychodzenie poza pokoj
	if ((x < 0) || (x > room_width)){
		x = xprevious;
	}
	if ((y < -8) || (y > room_height - 24)){
		y = yprevious;
	}
	*/
	
	//Efekty podloza
	scr_groundtype_fx();




}
	

}
