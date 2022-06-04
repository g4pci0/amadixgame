event_inherited();

image_speed = 0;
image_index = 0;

facing = 270;

hsp = 0;
vsp = 0;
spd = 0;
dir = 270;
_spd = 0;
_dir = 0;

accel = 0.6;
deccel = 0.32;

speedEffect = 0;

speedChange = 0;

walkspeed = 0.9;
runspeed = 1.55;

moving = false;
running = false;

canmove = true;

yorigin = 31;

cancollide = false;

stamina_drain = 0;

anim_speed = 0.12;
anim_fix = false;
anim_frame = 0;
anim_frame_num = 4;
anim_frame_action = 0;
anim_frame_action_num = 4;
anim_speed_action = 0.12;
slopefix = false;

playerVisible = true;

head_index = 0;
hands_index = 0;
hands2_index = 0;
torso_index = 0;
legs_index = 0;
boots_index = 0;
hat_index = 0;
arms_index = spr_none;
arms2_index = spr_none;
gun_index = 0;

shadowOriginY = 34;
shadowStyle = spr_shadow_player;
shadowAlpha = 0.5;

shadowEnable = true;

state = player_state.idle;
actionstate = player_state_action.none;

itemeaten = -1;
itemUsedX = 0;
itemUsedY = 0;
itemUsedAngle = 0;
itemUsedSx = 0;
itemUsedYscale = 1;
attackSpeedFix = false;

runningfix = true;
movingfix = true;

tenalarm = 0;

oneStepEvent[0] = true;
oneStepEvent[1] = true;
oneStepEvent[2] = 2;

z = 0;
zaxis = 0;
zfloor = 0;

hat_frame = 0;
hatY = 0;

stuffed = false;

shootdir = 0;
hand_xoffset = 0;
hand_yoffset = 0;
hand_rot = 0;

cx = 0;
cy = 0;

if (obj_gamecontrol.doTransition == true) scr_updatePlayerAnim();

