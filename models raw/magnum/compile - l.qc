
$modelname "gh3/fp/l/magnum.mdl"
$scale 1
$origin 0 0 0 -90

$cdmaterials "gh3\magnum"
$cdmaterials "gh3\hands\spartan"
$cdmaterials "gh3\hands\elite"

$attachment "camera_control" "camera_control" 0 0 0 rotate 0 0 0

$bodygroup "gun"
{
	studio "lhand.smd"
}

$poseparameter overlay_moving 0 1
$poseparameter overlay_move_x -1 1
$poseparameter overlay_move_y -1 1

$poseparameter overlay_look_p -1 1
$poseparameter overlay_look_y -1 1

$poseparameter overlay_pat1 -1 1
$poseparameter overlay_pat2 -1 1

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
$sequence "fire4" {
	"anims/fire4.smd"
	fps 30
	snap
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





$sequence "dual idle1" {
	"anims/dual idle1.smd"
	fps 30
}
$sequence "dual idle2" {
	"anims/dual idle2.smd"
	fps 30
}
$sequence "dual idle3" {
	"anims/dual idle3.smd"
	fps 30
}

$sequence "dual fire1" {
	"anims/dual fire1.smd"
	fps 30
	snap
}
$sequence "dual fire2" {
	"anims/dual fire2.smd"
	fps 30
	snap
}
$sequence "dual fire3" {
	"anims/dual fire3.smd"
	fps 30
	snap
}

$sequence "dual posing1" {
	"anims/dual posing1.smd"
	fps 30
}
$sequence "dual posing2" {
	"anims/dual posing2.smd"
	fps 30
}

$sequence "dual put_away" {
	"anims/dual put_away.smd"
	fps 30
}
$sequence "dual ready1" {
	"anims/dual ready1.smd"
	fps 30
	snap
}
$sequence "dual ready2" {
	"anims/dual ready2.smd"
	fps 30
	snap
}
$sequence "dual ready3" {
	"anims/dual ready3.smd"
	fps 30
	snap
}

$sequence "dual reload_empty1" {
	"anims/dual reload_empty1.smd"
	fps 30
}
$sequence "dual reload_empty2" {
	"anims/dual reload_empty2.smd"
	fps 30
}
$sequence "dual reload_full1" {
	"anims/dual reload_full1.smd"
	fps 30
}
$sequence "dual reload_full2" {
	"anims/dual reload_full2.smd"
	fps 30
}