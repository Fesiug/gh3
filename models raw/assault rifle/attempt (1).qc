
$modelname "gh3/fp/assault_rifle.mdl"
$scale 1
$origin 0 0 0 -90

$cdmaterials "gh3\assault_rifle"
$cdmaterials "gh3\hands\spartan"
$cdmaterials "gh3\hands\elite"

$attachment "camera_control" "camera_control" 0 0 0 rotate 0 0 0

$bodygroup "gun"
{
	studio "standard_standard.smd"
}

$bonemerge "base"
$bonemerge "l_upperarm"
$bonemerge "l_forearm"
$bonemerge "l_hand"
$bonemerge "l_index_low"
$bonemerge "l_index_mid"
$bonemerge "l_index_tip"
$bonemerge "l_middle_low"
$bonemerge "l_middle_mid"
$bonemerge "l_middle_tip"
$bonemerge "l_pinky_low"
$bonemerge "l_pinky_mid"
$bonemerge "l_pinky_tip"
$bonemerge "l_ring_low"
$bonemerge "l_ring_mid"
$bonemerge "l_ring_tip"
$bonemerge "l_thumb_low"
$bonemerge "l_thumb_mid"
$bonemerge "l_thumb_tip"
$bonemerge "a_lhand"
$bonemerge "r_upperarm"
$bonemerge "r_forearm"
$bonemerge "r_hand"
$bonemerge "r_index_low"
$bonemerge "r_index_mid"
$bonemerge "r_index_tip"
$bonemerge "r_middle_low"
$bonemerge "r_middle_mid"
$bonemerge "r_middle_tip"
$bonemerge "r_pinky_low"
$bonemerge "r_pinky_mid"
$bonemerge "r_pinky_tip"
$bonemerge "r_ring_low"
$bonemerge "r_ring_mid"
$bonemerge "r_ring_tip"
$bonemerge "r_thumb_low"
$bonemerge "r_thumb_mid"
$bonemerge "r_thumb_tip"
$bonemerge "a_rhand"

//

$poseparameter overlay_moving -1 1
$poseparameter overlay_move_x -1 1
$poseparameter overlay_move_y -1 1

$poseparameter overlay_look_p -1 1
$poseparameter overlay_look_y -1 1

$poseparameter overlay_pat1 -1 1
$poseparameter overlay_pat2 -1 1


$animation "h_norm" "anims/o_overlays.smd" {
	frames 0 0
	fps 30
}

$animation "h_notmoving" "anims/o_overlays.smd" {
	frames 0 0
	fps 30
	subtract "h_norm" 0
}
$animation "h_moving" "anims/o_moving.smd" {
	fps 30
	subtract "h_norm" 0
}

$sequence "o_moving" {
	"h_moving"
	"h_notmoving"
	"h_moving"

 	blend overlay_moving -1 1
 	blendwidth 3

	//autoplay
	delta
	fps 30
	hidden
	loop
}


$animation "o_m1" "anims/o_overlays.smd" {
	frames 1 1
	subtract "h_norm" 0
}
$animation "o_m2" "anims/o_overlays.smd" {
	frames 0 0
	subtract "h_norm" 0
}
$animation "o_m3" "anims/o_overlays.smd" {
	frames 2 2
	subtract "h_norm" 0
}
$sequence "overlay_move_x" {
	"o_m1"
	"o_m2"
	"o_m3"

 	blend overlay_move_x -1 1

	autoplay
	delta
	fps 30
	hidden
}


$animation "o_m4" "anims/o_overlays.smd" {
	frames 3 3
	subtract "h_norm" 0
}
$animation "o_m5" "anims/o_overlays.smd" {
	frames 0 0
	subtract "h_norm" 0
}
$animation "o_m6" "anims/o_overlays.smd" {
	frames 4 4
	subtract "h_norm" 0
}
$sequence "overlay_move_y" {
	"o_m4"
	"o_m5"
	"o_m6"

 	blend overlay_move_y -1 1

	autoplay
	delta
	fps 30
	hidden
}


$animation "o_l1" "anims/o_overlays.smd" {
	frames 8 8
	subtract "h_norm" 0
}
$animation "o_l2" "anims/o_overlays.smd" {
	frames 5 5
	subtract "h_norm" 0
}
$animation "o_l3" "anims/o_overlays.smd" {
	frames 9 9
	subtract "h_norm" 0
}
$sequence "overlay_look_p" {
	"o_l1"
	"o_l2"
	"o_l3"

 	blend overlay_look_p -1 1

	autoplay
	delta
	fps 30
	hidden
}


$animation "o_l4" "anims/o_overlays.smd" {
	frames 6 6
	subtract "h_norm" 0
}
$animation "o_l5" "anims/o_overlays.smd" {
	frames 5 5
	subtract "h_norm" 0
}
$animation "o_l6" "anims/o_overlays.smd" {
	frames 7 7
	subtract "h_norm" 0
}
$sequence "overlay_look_y" {
	"o_l4"
	"o_l5"
	"o_l6"

 	blend overlay_look_y -1 1

	autoplay
	delta
	fps 30
	hidden
}


$animation "o_p1" "anims/o_pitchandturn.smd" {
	frames 1 1
	subtract "h_norm" 0
}
$animation "o_p2" "anims/o_pitchandturn.smd" {
	frames 2 2
	subtract "h_norm" 0
}
$animation "o_p3" "anims/o_pitchandturn.smd" {
	frames 3 3
	subtract "h_norm" 0
}
$animation "o_p4" "anims/o_pitchandturn.smd" {
	frames 4 4
	subtract "h_norm" 0
}
$animation "o_p5" "anims/o_pitchandturn.smd" {
	frames 5 5
	subtract "h_norm" 0
}
$animation "o_p6" "anims/o_pitchandturn.smd" {
	frames 6 6
	subtract "h_norm" 0
}
$animation "o_p7" "anims/o_pitchandturn.smd" {
	frames 7 7
	subtract "h_norm" 0
}
$animation "o_p8" "anims/o_pitchandturn.smd" {
	frames 8 8
	subtract "h_norm" 0
}
$animation "o_p9" "anims/o_pitchandturn.smd" {
	frames 9 9
	subtract "h_norm" 0
}
$sequence "overlay_pat" {
	"o_p1" "o_p2" "o_p3"
	"o_p4" "o_p5" "o_p6"
	"o_p7" "o_p8" "o_p9"

	blendwidth 3
 	blend overlay_pat1 -1 1
 	blend overlay_pat2 -1 1

	autoplay
	delta
	fps 30
	hidden
}

//



$sequence "idle" {
	"anims/idle.smd"
	fps 30
	addlayer "o_moving"
}

$sequence "fire1" {
	"anims/fire1.smd"
	fps 30
	snap
}
$sequence "fire2" {
	"anims/fire2.smd"
	fps 30
	snap
}
$sequence "fire3" {
	"anims/fire3.smd"
	fps 30
	snap
}

$sequence "melee1" {
	"anims/melee1.smd"
	fps 30
}
$sequence "melee2" {
	"anims/melee2.smd"
	fps 30
}

$sequence "posing1" {
	"anims/posing1.smd"
	fps 30
}
$sequence "posing2" {
	"anims/posing2.smd"
	fps 30
}

$sequence "put_away" {
	"anims/put_away.smd"
	fps 30
}
$sequence "ready" {
	"anims/ready.smd"
	fps 30
	snap
}

$sequence "reload_empty" {
	"anims/reload_empty.smd"
	fps 30
}
$sequence "reload_full" {
	"anims/reload_full.smd"
	fps 30
}

$sequence "throw_equipment" {
	"anims/throw_equipment.smd"
	fps 30
}
$sequence "throw_grenade" {
	"anims/throw_grenade.smd"
	fps 30
}

//$include "holyshit.qci"
