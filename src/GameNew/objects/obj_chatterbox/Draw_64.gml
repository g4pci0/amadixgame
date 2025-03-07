if (cutsceneStep != 0){exit;}

if (ChatterboxIsStopped(chatterbox)){
    //If we've stopped we should say so
    //In a real game you'd close the dialogue system and permit user interaction again
    instance_destroy();
}else{
	
	//draw_text(128,128,boxType);

if (!show)exit;



function choiceshow(){
	var _j = 0;
    repeat(array_length(choice_elements)){
        //Get our text element and position
        var _struct = choice_elements[_j];
        var _x       = choicebox2_tox + 4;
        var _y       = _struct.y;
        var _element = _struct.element;
        var _typist  = _struct.typist;
		
		var _scale = 0.75;
		
        //Draw the text element
		_element.transform(_scale, _scale, 0);
		_element.wrap((text_width * 1/_scale), (text_height * 1/_scale) + 4, false);
		//_element.scale_to_box((text_width * 1/_scale), (text_height * 1/_scale));
       
	    _element.blend(c_white, 0.5);
		_element.starting_format("font_dialogue", shadowColor);
		if (choiceAnim)
			_element.draw(choicebox2_x + 4 + .5, _y + .5, _typist);	
		else
			_element.draw(choicebox2_tox + 4 + .5, _y + .5, _typist);	
		
		
		_element.blend(c_white, 1);
		_element.starting_format("font_dialogue", textColor);
		if (choiceAnim)
			_element.draw(choicebox2_x + 4, _y, _typist);
		else
			_element.draw(choicebox2_tox + 4, _y, _typist);
		
		
		if (mySound != -1)
			_typist.sound(asset_get_index(mySound), 10, 1, 1);
		
        
        //Break out of the loop if this text element hasn't finished fading in
        if (_typist.get_state() < 1.0) break;
        //Autotype will only happen when you actually draw the text element
        //This means if we don't want to fade text in we can just... not draw it
        
        ++_j;
    }
}
	
	
	
	switch(boxType){
		case 0:
			
			
			// Main dialoguebox
			scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX_amadix, dialboxY, dialboxX_amadix + dialbox_width, dialboxY + dialbox_height);
			
			// Namebox
			scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX_amadix, nameboxY, portraitboxX_amadix + portraitbox_width, nameboxY + namebox_height);
			
			// Name
			var _name = scribble(myName);
			var name_scale = .75;
			var nameX = portraitboxX_amadix + portraitbox_width/2;
			var nameY = nameboxY + namebox_height/2;
			
			_name.transform(name_scale, name_scale, 0);
			_name.starting_format("font_dialogue", textColor);
			_name.fit_to_box( ( (portraitboxX_amadix + portraitbox_width - 4) * 1/name_scale), ( (nameboxY + namebox_height) * 1/name_scale), true);
			_name.align(fa_center, fa_middle);
			
			_name.blend(c_white, 0.5);
			_name.starting_format("font_dialogue", shadowColor);
			_name.draw(nameX + .5, nameY + .5);
			
			_name.blend(c_white, 1);
			_name.starting_format("font_dialogue", textColor);
			_name.draw(nameX, nameY);
			
			// Portraitbox
			scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX_amadix, dialboxY, portraitboxX_amadix + portraitbox_width, dialboxY + dialbox_height);
			
			// Portrait
			draw_sprite(spr_portrait_amadix,
			dialogue_emotion_convert(myEmotion),
			portraitboxX_amadix, dialboxY);
			
			draw_sprite(spr_portrait_amadix_hats,
			dialogue_hat(global.playerHat),
			portraitboxX_amadix, dialboxY);
			
			// Portrait edge
			scr_draw_gui_box_stretch(spr_dialoguebox_edge, portraitboxX_amadix, dialboxY, portraitboxX_amadix + portraitbox_width, dialboxY + dialbox_height);
			
			if (waitArrow){
				draw_sprite(spr_dialoguebox_arrow, 0, dialboxX_amadix + dialbox_width, dialboxY + dialbox_height);	
			}
			
		break;
		case 1:
			
			// Main dialoguebox
			//scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX, dialboxY, dialboxX + dialbox_width, dialboxY + dialbox_height);
			draw_sprite_ext(spr_dialoguebox_black, 0, dialboxX, dialboxY, dialbox_width, 1, 0, c_white, 1);

			// Namebox
			//scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX, nameboxY, portraitboxX + portraitbox_width, nameboxY + namebox_height);
			draw_sprite(spr_dialoguebox_namebox_black, 0, portraitboxX, nameboxY);
			
			// Name
			var _name = scribble(myName);
			var name_scale = .75;
			var nameX = portraitboxX + portraitbox_width/2;
			var nameY = nameboxY + namebox_height/2;
			
			_name.transform(name_scale, name_scale, 0);
			_name.starting_format("font_dialogue", textColor);
			_name.fit_to_box( ( (portraitboxX + portraitbox_width - 4) * 1/name_scale), ( (nameboxY + namebox_height) * 1/name_scale), true);
			_name.align(fa_center, fa_middle);
			
			_name.blend(c_white, 0.5);
			_name.starting_format("font_dialogue", shadowColor);
			_name.draw(nameX + .5, nameY + .5);
			
			_name.blend(c_white, 1);
			_name.starting_format("font_dialogue", textColor);
			_name.draw(nameX, nameY);
			
			// Portraitbox
			//scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX, dialboxY, portraitboxX + portraitbox_width, dialboxY + dialbox_height);
			draw_sprite_ext(spr_dialoguebox_black, 0, portraitboxX, dialboxY, portraitbox_width, 1, 0, c_white, 1);
			
			// Portrait
			draw_sprite(asset_get_index(myPortrait),
			dialogue_emotion_convert(myEmotion),
			portraitboxX, dialboxY);
			
			// Portrait edge
			//scr_draw_gui_box_stretch(spr_dialoguebox_edge, portraitboxX, dialboxY, portraitboxX + portraitbox_width, dialboxY + dialbox_height);
			
			if (waitArrow){
				//draw_sprite(spr_dialoguebox_arrow, 0, dialboxX + dialbox_width, dialboxY + dialbox_height);	
			}
		break;
		case 2:
			
			scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX_empty, dialboxY, dialboxX_empty + dialbox_width, dialboxY + dialbox_height);	
		
			if (waitArrow){
				draw_sprite(spr_dialoguebox_arrow, 0, dialboxX_empty + dialbox_width, dialboxY + dialbox_height);	
			}
		break;
		case 3:
		
			if (choiceAnim){
				if (choiceboxStep <= 8){
					// Choicebox	
					if (choiceNum == 1){
						draw_sprite(spr_dialoguebox_choice, onChoice[0], choiceboxX2[0], dialboxY);
					}else
					if (choiceNum == 2){
							draw_sprite(spr_dialoguebox_choice, 0, choiceboxX2[0], dialboxY);
							draw_sprite(spr_dialoguebox_choice, 0, choiceboxX2[1], dialboxY + 16);
					}else
					if (choiceNum == 3){
							draw_sprite(spr_dialoguebox_choice, 0, choiceboxX2[0], dialboxY);
							draw_sprite(spr_dialoguebox_choice, 0, choiceboxX2[1], dialboxY + 16);
							draw_sprite(spr_dialoguebox_choice, 0, choiceboxX2[2], dialboxY + 32);
					}else{
							draw_sprite(spr_dialoguebox_choice, 0, choiceboxX2[0], dialboxY);
							draw_sprite(spr_dialoguebox_choice, 0, choiceboxX2[1], dialboxY + 16);
							draw_sprite(spr_dialoguebox_choice, 0, choiceboxX2[2], dialboxY + 32);
							draw_sprite(spr_dialoguebox_choice, 0, choiceboxX2[3], dialboxY + 48);
					}
					
					choiceshow();
				}
				
					
				
					// Main dialoguebox
					scr_draw_gui_box_stretch(spr_dialoguebox, choicebox1_x, dialboxY, choicebox1_x + dialbox_width, dialboxY + dialbox_height);	
				
				
			}else{

				// Choicebox
				if (choiceNum == 1){
					draw_sprite(spr_dialoguebox_choice, onChoice[0], choiceboxX, dialboxY);
				}else
				if (choiceNum == 2){
						draw_sprite(spr_dialoguebox_choice, onChoice[0], choiceboxX, dialboxY);
						draw_sprite(spr_dialoguebox_choice, onChoice[1], choiceboxX, dialboxY + 16);
				}else
				if (choiceNum == 3){
						draw_sprite(spr_dialoguebox_choice, onChoice[0], choiceboxX, dialboxY);
						draw_sprite(spr_dialoguebox_choice, onChoice[1], choiceboxX, dialboxY + 16);
						draw_sprite(spr_dialoguebox_choice, onChoice[2], choiceboxX, dialboxY + 32);
				}else{
						draw_sprite(spr_dialoguebox_choice, onChoice[0], choiceboxX, dialboxY);
						draw_sprite(spr_dialoguebox_choice, onChoice[1], choiceboxX, dialboxY + 16);
						draw_sprite(spr_dialoguebox_choice, onChoice[2], choiceboxX, dialboxY + 32);
						draw_sprite(spr_dialoguebox_choice, onChoice[3], choiceboxX, dialboxY + 48);
				}

				// Main dialoguebox
				scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX_choice, dialboxY, dialboxX_choice + dialbox_width, dialboxY + dialbox_height);	
			
				choiceshow();

				// Choice arrows
				if (choiceNum > 4){
					if (choiceScroll >= 0){
						draw_sprite(spr_dialoguebox_arrowscroll, 0, 430, 200);
					}
					
					if (choiceScroll < choiceNum){
						draw_sprite(spr_dialoguebox_arrowscroll, 1, 430, 258);
					}
				}
			}

		break;
		case 4:
				// Main dialoguebox
				scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX_amadix, dialboxY, dialboxX_amadix + dialboxX_amadix + dialboxX_empty, dialboxY + dialbox_height);	
		break;
	}
	
	var _i = 0;
	
    repeat(array_length(text_elements)){
        //Get our text element and position
        var _struct = text_elements[_i];
        var _x       = _struct.x;
        var _y       = _struct.y;
        var _element = _struct.element;
        var _typist  = _struct.typist;
		
		var _scale = 0.75;
		
		
        //Draw the text element
		_element.transform(_scale, _scale, 0);
		_element.wrap((text_width * 1/_scale), (text_height * 1/_scale) + 4, false);
		//_element.scale_to_box((text_width * 1/_scale), (text_height * 1/_scale));
       
	    _element.blend(c_white, 0.5);
		_element.starting_format("font_dialogue", shadowColor);
		if (choiceAnim){
			_element.draw(choicebox1_x + 4 + .5, _y + .5, _typist);	
		}else{
			_element.draw(_x + .5  - textfix, _y + .5, _typist);	
		}
		
		
		_element.blend(c_white, 1);
		_element.starting_format("font_dialogue", textColor);
		if (choiceAnim){
			_element.draw(choicebox1_x + 4, _y, _typist);
		}else{
			_element.draw(_x - textfix, _y, _typist);
		}
		
		
		if (mySound != -1)
			_typist.sound(asset_get_index(mySound), 10, 1, 1);
		
        
        //Break out of the loop if this text element hasn't finished fading in
        if (_typist.get_state() < 1.0) break;
        //Autotype will only happen when you actually draw the text element
        //This means if we don't want to fade text in we can just... not draw it
        
        ++_i;
    }
	
	


}
/*
draw_text(128, 128, choiceAnim);
draw_text(128, 148, boxType);
draw_text(128, 164, choiceStop);
*/