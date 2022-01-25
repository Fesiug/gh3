
$modelname "gh3/fp/multiplayer ball.mdl"
$scale 1
$origin 0 0 0 -90

$cdmaterials "gh3\multiplayer ball"
$cdmaterials "gh3\hands\spartan"
$cdmaterials "gh3\hands\elite"

$attachment "camera_control" "camera_control" 0 0 0 rotate 0 0 0

$bodygroup "gun"
{
	studio "default_default.smd"
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
$bonemerge "adjust"
$bonemerge "skull"

$sequence "idle" {
	"anims/idle.smd"
	fps 30
}

$sequence "melee1" {
	"anims/melee1.smd"
	fps 30
	snap
}
$sequence "melee2" {
	"anims/melee2.smd"
	fps 30
	snap
}
$sequence "melee3" {
	"anims/melee3.smd"
	fps 30
	snap
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

$sequence "throw_equipment" {
	"anims/throw_equipment.smd"
	fps 30
}





$sequence "e idle" {
	"anims e/idle.smd"
	fps 30
}

$sequence "e melee1" {
	"anims e/melee1.smd"
	fps 30
	snap
}
$sequence "e melee2" {
	"anims e/melee2.smd"
	fps 30
	snap
}
$sequence "e melee3" {
	"anims e/melee3.smd"
	fps 30
	snap
}

$sequence "e posing1" {
	"anims e/posing1.smd"
	fps 30
}
$sequence "e posing2" {
	"anims e/posing2.smd"
	fps 30
}

$sequence "e put_away" {
	"anims e/put_away.smd"
	fps 30
}
$sequence "e ready" {
	"anims e/ready.smd"
	fps 30
	snap
}

$sequence "e throw_equipment" {
	"anims e/throw_equipment.smd"
	fps 30
}

$include "holyshit.qci"