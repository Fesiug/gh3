
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

$sequence "idle" {
	"anims/idle.smd"
	fps 30
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

$include "holyshit.qci"
