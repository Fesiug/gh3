
local pn = {100, 100}
local g_vol = 0.5

sound.Add( {
	name = "GH3S.Depleted",
	channel = CHAN_AUTO,
	volume = g_vol,
	pitch = pn,
	sound = "gh3s/shield_depleted/deplete/loop[shield_depleted].wav",
} )

sound.Add( {
	name = "GH3S.Depleted.E",
	channel = CHAN_AUTO,
	volume = g_vol,
	pitch = pn,
	sound = "gh3s/shield_depleted_dervish/new_depleted/loop[new_shield_depleted2].wav",
} )

sound.Add( {
	name = "GH3S.Low",
	channel = CHAN_AUTO,
	volume = g_vol,
	pitch = pn,
	sound = "gh3s/shield_low/low/loop[shield_low].wav",
} )

sound.Add( {
	name = "GH3S.Low.E",
	channel = CHAN_AUTO,
	volume = g_vol,
	pitch = pn,
	sound = "gh3s/shield_low_dervish/new_low/loop[new_shield_low].wav",
} )

sound.Add( {
	name = "GH3S.Charge",
	channel = CHAN_AUTO,
	volume = g_vol,
	pitch = pn,
	sound = "gh3s/shield_charge/charge/loop[shield_charge].wav",
} )

sound.Add( {
	name = "GH3S.Charge.E",
	channel = CHAN_AUTO,
	volume = g_vol,
	pitch = pn,
	sound = "gh3s/shield_charge_dervish/new_charge/loop[new_shield_charge6].wav",
} )

sound.Add( {
	name = "GH3S.Hit",
	channel = CHAN_AUTO,
	volume = g_vol,
	pitch = pn,
	sound = "gh3s/shield_hit[shield_hit].wav",
} )

sound.Add( {
	name = "GH3U.RespawnCountdown",
	channel = CHAN_STATIC,
	volume = 1,
	pitch = pn,
	sound = "gh3u/countdown_for_respawn[respawn_timer].wav",
} )

sound.Add( {
	name = "GH3U.Respawn",
	channel = CHAN_STATIC,
	volume = 1,
	pitch = pn,
	sound = "gh3u/player_respawn[player_respawn].wav",
} )

-- Assault Rifle

sound.Add( {
	name = "GH3.AR.Fire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/assault_rifle/ar_fire[19103_b].wav",
		")gh3/assault_rifle/ar_fire[19203_b].wav",
		")gh3/assault_rifle/ar_fire[19204_b].wav"
	}
} )

sound.Add( {
	name = "GH3.AR.FireFar",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/assault_rifle/assault_rifle_lod_far[assault_rifle_lod_far1].wav",
		")gh3/assault_rifle/assault_rifle_lod_far[assault_rifle_lod_far2].wav",
		")gh3/assault_rifle/assault_rifle_lod_far[assault_rifle_lod_far3].wav"
	}
} )

sound.Add( {
	name = "GH3.AR.Reload",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/assault_rifle/ar_reload[ar_reloada].wav",
		")gh3/assault_rifle/ar_reload[ar_reloadb].wav",
		")gh3/assault_rifle/ar_reload[ar_reloadc].wav"
	}
} )

sound.Add( {
	name = "GH3.AR.Posing1",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/assault_rifle/assault_rifle_pose_var1[assault_rifle_pose_var1_01].wav",
		")gh3/assault_rifle/assault_rifle_pose_var1[assault_rifle_pose_var1_02].wav",
		")gh3/assault_rifle/assault_rifle_pose_var1[assault_rifle_pose_var1_03].wav",
	}
} )

sound.Add( {
	name = "GH3.AR.Posing2",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/assault_rifle/assault_rifle_pose_var2[assault_rifle_pose_var2_01].wav",
		")gh3/assault_rifle/assault_rifle_pose_var2[assault_rifle_pose_var2_02].wav",
	}
} )

sound.Add( {
	name = "GH3.AR.Ready",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/assault_rifle/ar_ready[ar_readya].wav",
		")gh3/assault_rifle/ar_ready[ar_readyb].wav",
		")gh3/assault_rifle/ar_ready[ar_readyc].wav"
	}
} )

sound.Add( {
	name = "GH3.AR.Melee1",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/assault_rifle/ar_melee1[ar_melee1a].wav",
		")gh3/assault_rifle/ar_melee1[ar_melee1b].wav",
		")gh3/assault_rifle/ar_melee1[ar_melee1c].wav"
	}
} )

sound.Add( {
	name = "GH3.AR.Melee2",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/assault_rifle/ar_melee2[ar_melee2a].wav",
		")gh3/assault_rifle/ar_melee2[ar_melee2b].wav",
		")gh3/assault_rifle/ar_melee2[ar_melee2c].wav"
	}
} )

-- Plasma Rifle

sound.Add( {
	name = "GH3.PR.Fire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = ")gh3/plasma_rifle/plas_rifle_fire[plas_rif_fire].wav",
} )

sound.Add( {
	name = "GH3.PR.OH_Exit",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/plasma_rifle/plasrifle_oh_exit[oh_exit].wav",
	}
} )

sound.Add( {
	name = "GH3.PR.OH_Enter",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/plasma_rifle/plasrifle_overheat[overheat].wav",
	}
} )

sound.Add( {
	name = "GH3.PR.Posing1",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = ")gh3/plasma_rifle/plasrifle_posing_zero[plasrifle_posing_zero].wav",
} )

sound.Add( {
	name = "GH3.PR.Posing2",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = ")gh3/plasma_rifle/plasrifle_posing_one[plasrifle_posing_one].wav",
} )

sound.Add( {
	name = "GH3.PR.Ready",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = ")gh3/plasma_rifle/plasrifle_ready[plasrifle_ready].wav"
} )

sound.Add( {
	name = "GH3.PR.Melee1",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/plasma_rifle/plasrifle_melee1[plasrifle_melee1].wav",
		")gh3/plasma_rifle/plasrifle_melee1[plasrifle_melee2].wav",
		")gh3/plasma_rifle/plasrifle_melee1[plasrifle_melee3].wav",
	}
} )

-- SMG

sound.Add( {
	name = "GH3.SMG.FireIn",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/smg/smg_loop/smg_loop/in[smg_in].wav",
	}
} )

sound.Add( {
	name = "GH3.SMG.FireLoop",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/smg/smg_loop/smg_loop/loop[smg_loop].wav",
	}
} )

sound.Add( {
	name = "GH3.SMG.FireOut",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/smg/smg_loop/smg_loop/out[smg_out].wav",
	}
} )

sound.Add( {
	name = "GH3.SMG.Reload",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/smg/smg_fp/smg_reload[smg_reload1].wav",
		")gh3/smg/smg_fp/smg_reload[smg_reload2].wav",
		")gh3/smg/smg_fp/smg_reload[smg_reload3].wav",
	}
} )

sound.Add( {
	name = "GH3.SMG.Posing1",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/smg/smg_fp/smg_posing0[smg_pose0a].wav",
		")gh3/smg/smg_fp/smg_posing0[smg_pose0b].wav",
		")gh3/smg/smg_fp/smg_posing0[smg_pose0c].wav",
	}
} )

sound.Add( {
	name = "GH3.SMG.Posing2",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/smg/smg_fp/smg_posing1[smg_pose1a].wav",
		")gh3/smg/smg_fp/smg_posing1[smg_pose1b].wav",
		")gh3/smg/smg_fp/smg_posing1[smg_pose1c].wav",
	}
} )

sound.Add( {
	name = "GH3.SMG.Ready",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/smg/smg_fp/smg_ready[smg_ready1].wav",
		")gh3/smg/smg_fp/smg_ready[smg_ready2].wav",
		")gh3/smg/smg_fp/smg_ready[smg_ready3].wav",
	}
} )

sound.Add( {
	name = "GH3.SMG.Melee1",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/smg/smg_fp/smg_melee_strike[smg_melee1].wav",
		")gh3/smg/smg_fp/smg_melee_strike[smg_melee2].wav",
		")gh3/smg/smg_fp/smg_melee_strike[smg_melee3].wav",
	}
} )

-- Battle Rifle

sound.Add( {
	name = "GH3.BR.Fire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/battle_rifle/fire_burst_h3[battle_rifle_fire2].wav",
		")gh3/battle_rifle/fire_burst_h3[battle_rifle_fire3].wav",
		")gh3/battle_rifle/fire_burst_h3[battle_rifle_fire4].wav",
		")gh3/battle_rifle/fire_burst_h3[battle_rifle_fire5].wav",
		")gh3/battle_rifle/fire_burst_h3[battle_rifle_fire6].wav",
		")gh3/battle_rifle/fire_burst_h3[battle_rifle_fire7].wav",
		")gh3/battle_rifle/fire_burst_h3[battle_rifle_fire8].wav"
	}
} )

sound.Add( {
	name = "GH3.BR.Eject",
	channel = CHAN_STATIC,
	volume = 0.4,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/battle_rifle/eject_br[ejectshell].wav",
		")gh3/battle_rifle/eject_br[ejectshell2].wav",
		")gh3/battle_rifle/eject_br[ejectshell3].wav",
		")gh3/battle_rifle/eject_br[ejectshell4].wav",
	}
} )

sound.Add( {
	name = "GH3.BR.Dryfire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/battle_rifle/dryfire[ardryfire22].wav",
	}
} )

sound.Add( {
	name = "GH3.BR.Ammo",
	channel = CHAN_AUTO,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = ")gh3/battle_rifle/battle_rifle_ammo[ar_reload].wav",
} )

sound.Add( {
	name = "GH3.BR.ZoomIn",
	channel = CHAN_STATIC,
	volume = g_vol,
	pitch = pn,
	sound = ")gh3/battle_rifle/battle_rifle_zoom_in[battle_rifle_zoom_in].wav",
} )

sound.Add( {
	name = "GH3.BR.ZoomOut",
	channel = CHAN_STATIC,
	volume = g_vol,
	pitch = pn,
	sound = ")gh3/battle_rifle/battle_rifle_zoom_out[battle_rifle_zoom_out].wav",
} )

sound.Add( {
	name = "GH3.BR.Reload_Empty",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/battle_rifle/battle_rifle_fp/br_reload_empty[br_reload_empty1].wav",
		")gh3/battle_rifle/battle_rifle_fp/br_reload_empty[br_reload_empty2].wav",
		")gh3/battle_rifle/battle_rifle_fp/br_reload_empty[br_reload_empty3].wav"
	}
} )

sound.Add( {
	name = "GH3.BR.Reload_Full",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/battle_rifle/battle_rifle_fp/br_reload_full[br_reload_full1].wav",
		")gh3/battle_rifle/battle_rifle_fp/br_reload_full[br_reload_full2].wav",
		")gh3/battle_rifle/battle_rifle_fp/br_reload_full[br_reload_full3].wav"
	}
} )

sound.Add( {
	name = "GH3.BR.Posing1",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/battle_rifle/battle_rifle_fp/battle_rifle_pose_var1[battle_rifle_pose_var1_01].wav",
		")gh3/battle_rifle/battle_rifle_fp/battle_rifle_pose_var1[battle_rifle_pose_var1_02].wav",
		")gh3/battle_rifle/battle_rifle_fp/battle_rifle_pose_var1[battle_rifle_pose_var1_03].wav",
		")gh3/battle_rifle/battle_rifle_fp/battle_rifle_pose_var1[battle_rifle_pose_var1_04].wav",
	}
} )

sound.Add( {
	name = "GH3.BR.Posing2",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/battle_rifle/battle_rifle_fp/battle_rifle_pose_var2[battle_rifle_pose_var2_01].wav",
		")gh3/battle_rifle/battle_rifle_fp/battle_rifle_pose_var2[battle_rifle_pose_var2_02].wav",
		")gh3/battle_rifle/battle_rifle_fp/battle_rifle_pose_var2[battle_rifle_pose_var2_03].wav",
	}
} )

sound.Add( {
	name = "GH3.BR.Ready",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/battle_rifle/battle_rifle_fp/br_ready[br_ready1].wav",
		")gh3/battle_rifle/battle_rifle_fp/br_ready[br_ready2].wav",
	}
} )

sound.Add( {
	name = "GH3.BR.Melee1",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/battle_rifle/battle_rifle_fp/br_melee1[br_melee1a].wav",
		")gh3/battle_rifle/battle_rifle_fp/br_melee1[br_melee1b].wav",
		")gh3/battle_rifle/battle_rifle_fp/br_melee1[br_melee1c].wav"
	}
} )

sound.Add( {
	name = "GH3.BR.Melee2",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/battle_rifle/battle_rifle_fp/br_melee2[br_melee2a].wav",
		")gh3/battle_rifle/battle_rifle_fp/br_melee2[br_melee2b].wav",
		")gh3/battle_rifle/battle_rifle_fp/br_melee2[br_melee2c].wav"
	}
} )

-- Magnum

sound.Add( {
	name = "GH3.Magnum.Fire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/magnum/magnum_fire[magnum_stereo1].wav",
		")gh3/magnum/magnum_fire[magnum_stereo2].wav",
		")gh3/magnum/magnum_fire[magnum_stereo3].wav",
		")gh3/magnum/magnum_fire[magnum_stereo4].wav",
	}
} )

sound.Add( {
	name = "GH3.Magnum.Eject",
	channel = CHAN_STATIC,
	volume = 0.4,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/magnum/magnum_eject[ejectshell].wav",
		")gh3/magnum/magnum_eject[ejectshell2].wav",
		")gh3/magnum/magnum_eject[ejectshell3].wav",
		")gh3/magnum/magnum_eject[ejectshell4].wav",
	}
} )

sound.Add( {
	name = "GH3.Magnum.Dryfire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/magnum/magnum_dryfire[pistdryfire].wav",
	}
} )

sound.Add( {
	name = "GH3.Magnum.Ammo",
	channel = CHAN_AUTO,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = ")gh3/magnum/magnum_ammo[magnum_ammo].wav",
} )

sound.Add( {
	name = "GH3.Magnum.Reload",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/magnum/magnum_fp/magnum_reload[magnum_reload_1].wav",
		")gh3/magnum/magnum_fp/magnum_reload[magnum_reload_2].wav",
		")gh3/magnum/magnum_fp/magnum_reload[magnum_reload_3].wav"
	}
} )

sound.Add( {
	name = "GH3.Magnum.Posing1",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/magnum/magnum_fp/magnum_pose1[magnum_pose1_1].wav",
		")gh3/magnum/magnum_fp/magnum_pose1[magnum_pose1_2].wav",
		")gh3/magnum/magnum_fp/magnum_pose1[magnum_pose1_3].wav",
	}
} )

sound.Add( {
	name = "GH3.Magnum.Posing2",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/magnum/magnum_fp/magnum_pose2[magnum_pose2_1].wav",
		")gh3/magnum/magnum_fp/magnum_pose2[magnum_pose2_2].wav",
		")gh3/magnum/magnum_fp/magnum_pose2[magnum_pose2_3].wav",
		")gh3/magnum/magnum_fp/magnum_pose2[magnum_pose2_4].wav",
	}
} )

sound.Add( {
	name = "GH3.Magnum.Ready",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/magnum/magnum_fp/magnum_ready[magnum_ready_1].wav",
		")gh3/magnum/magnum_fp/magnum_ready[magnum_ready_2].wav",
	}
} )

sound.Add( {
	name = "GH3.Magnum.Melee",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/magnum/magnum_fp/magnum_melee[magnum_melee_1].wav",
		")gh3/magnum/magnum_fp/magnum_melee[magnum_melee_2].wav",
		")gh3/magnum/magnum_fp/magnum_melee[magnum_melee_3].wav"
	}
} )

-- Rocket Launcher

sound.Add( {
	name = "GH3.RocketLauncher.Fire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/rocket_launcher/rocket_fire_h3[rocket_h3_1].wav",
		")gh3/rocket_launcher/rocket_fire_h3[rocket_h3_2].wav",
		")gh3/rocket_launcher/rocket_fire_h3[rocket_h3_3].wav",
		")gh3/rocket_launcher/rocket_fire_h3[rocket_h3_4].wav",
	}
} )

sound.Add( {
	name = "GH3.RocketLauncher.Anim",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_fire[fp_rl_fire1].wav",
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_fire[fp_rl_fire2].wav",
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_fire[fp_rl_fire3].wav",
	}
} )

sound.Add( {
	name = "GH3.RocketLauncher.Anim_E",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = ")gh3/rocket_launcher/rocket_fire_anim[rocket_fire_anim].wav",
} )

sound.Add( {
	name = "GH3.RocketLauncher.Ammo",
	channel = CHAN_AUTO,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = ")gh3/rocket_launcher/rocket_ammo[rocket_reload_e].wav",
} )

sound.Add( {
	name = "GH3.RocketLauncher.ZoomIn",
	channel = CHAN_STATIC,
	volume = g_vol,
	pitch = pn,
	sound = ")gh3/rocket_launcher/rocket_launcher_zoom_in[rocket_launcher_zoom_in].wav",
} )

sound.Add( {
	name = "GH3.RocketLauncher.ZoomOut",
	channel = CHAN_STATIC,
	volume = g_vol,
	pitch = pn,
	sound = ")gh3/rocket_launcher/rocket_launcher_zoom_out[rocket_launcher_zoom_out].wav",
} )

sound.Add( {
	name = "GH3.RocketLauncher.Reload",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_reload[fp_rl_reload1].wav",
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_reload[fp_rl_reload2].wav",
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_reload[fp_rl_reload3].wav",
	}
} )

sound.Add( {
	name = "GH3.RocketLauncher.Reload_E",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = ")gh3/rocket_launcher/rocket_reload[rocket_reload].wav",
} )

sound.Add( {
	name = "GH3.RocketLauncher.Posing1",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_posing1[fp_rl_posing1_1].wav",
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_posing1[fp_rl_posing1_2].wav",
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_posing1[fp_rl_posing1_3].wav",
	}
} )

sound.Add( {
	name = "GH3.RocketLauncher.Posing2",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_posing2[fp_rl_posing2_1].wav",
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_posing2[fp_rl_posing2_2].wav",
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_posing2[fp_rl_posing2_3].wav",
	}
} )

sound.Add( {
	name = "GH3.RocketLauncher.Posing3",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = ")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_posing3[fp_rl_posing3].wav"
} )

sound.Add( {
	name = "GH3.RocketLauncher.Ready",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = ")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_ready[fp_rl_ready].wav",
} )

sound.Add( {
	name = "GH3.RocketLauncher.Melee",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_melee[fp_rl_melee1].wav",
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_melee[fp_rl_melee2].wav",
		")gh3/rocket_launcher/fp_rocket_launcher/fp_rl_melee[fp_rl_melee3].wav",
	}
} )

sound.Add( {
	name = "GH3.RocketLauncher.Melee_E",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = ")gh3/rocket_launcher/rocket_melee_strike[rl_melee_strike].wav",
} )

sound.Add( {
	name = "GH3.Rocket.Explode",
	channel = CHAN_STATIC,
	volume = 1,
	level = 80,
	pitch = pn,
	sound = {
		")gh3/rocket_launcher/rocket_expl[rocket_expl1].wav",
		")gh3/rocket_launcher/rocket_expl[rocket_expl2].wav",
		")gh3/rocket_launcher/rocket_expl[rocket_expl3].wav",
		")gh3/rocket_launcher/rocket_expl[rocket_expl4].wav",
		")gh3/rocket_launcher/rocket_expl[rocket_expl5].wav",
		")gh3/rocket_launcher/rocket_expl[rocket_expl6].wav",
	},
} )

sound.Add( {
	name = "GH3.Rocket.ExplodeFar",
	channel = CHAN_STATIC,
	volume = 1,
	level = 165,
	pitch = pn,
	sound = {
		")gh3/rocket_launcher/rocket_expl_lod_far[rocket_expl_lod_far1].wav",
		")gh3/rocket_launcher/rocket_expl_lod_far[rocket_expl_lod_far2].wav",
		")gh3/rocket_launcher/rocket_expl_lod_far[rocket_expl_lod_far3].wav",
	}
} )

sound.Add( {
	name = "GH3.Rocket.Loop",
	channel = CHAN_STATIC,
	volume = 1,
	level = 60,
	pitch = pn,
	sound = {
		")gh3/rocket_launcher/rocket_proj/projectile/loop[rl_proj_lp1].wav",
		")gh3/rocket_launcher/rocket_proj/projectile/loop[rl_proj_lp2].wav",
		")gh3/rocket_launcher/rocket_proj/projectile/loop[rl_proj_lp3].wav",
	}
} )

-- Shotgun

sound.Add( {
	name = "GH3.Shotgun.Fire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/shotgun/fire[shotgun1].wav",
		")gh3/shotgun/fire[shotgun2].wav",
		")gh3/shotgun/fire[shotgun3].wav",
	}
} )

sound.Add( {
	name = "GH3.Shotgun.Dryfire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/magnum/magnum_dryfire[pistdryfire].wav",
	}
} )

sound.Add( {
	name = "GH3.Shotgun.Ammo",
	channel = CHAN_AUTO,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = ")gh3/shotgun/shotgun_ammo[shotgun_ready].wav",
} )

sound.Add( {
	name = "GH3.Shotgun.Reload",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/shotgun/shotgun_fp/sg_reload_loop[shotgun_reload_loop1].wav",
		")gh3/shotgun/shotgun_fp/sg_reload_loop[shotgun_reload_loop2].wav",
		")gh3/shotgun/shotgun_fp/sg_reload_loop[shotgun_reload_loop3].wav",
		")gh3/shotgun/shotgun_fp/sg_reload_loop[shotgun_reload_loop4].wav",
		")gh3/shotgun/shotgun_fp/sg_reload_loop[shotgun_reload_loop5].wav",
		")gh3/shotgun/shotgun_fp/sg_reload_loop[shotgun_reload_loop6].wav",
		")gh3/shotgun/shotgun_fp/sg_reload_loop[shotgun_reload_loop7].wav",
		")gh3/shotgun/shotgun_fp/sg_reload_loop[shotgun_reload_loop8].wav",
	}
} )

sound.Add( {
	name = "GH3.Shotgun.ReloadExit",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = ")gh3/shotgun/shotgun_fp/sg_reload_exit[sg_reload_exit].wav",
} )

sound.Add( {
	name = "GH3.Shotgun.Posing1",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/shotgun/shotgun_fp/sg_posing0[sg_posing0_a].wav",
		")gh3/shotgun/shotgun_fp/sg_posing0[sg_posing0_b].wav",
		")gh3/shotgun/shotgun_fp/sg_posing0[sg_posing0_c].wav",
	}
} )

sound.Add( {
	name = "GH3.Shotgun.Posing2",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/shotgun/shotgun_fp/sg_posing1[sg_posing1_a].wav",
		")gh3/shotgun/shotgun_fp/sg_posing1[sg_posing1_b].wav",
		")gh3/shotgun/shotgun_fp/sg_posing1[sg_posing1_c].wav",
	}
} )

sound.Add( {
	name = "GH3.Shotgun.Pump",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = ")gh3/shotgun/shotgun_fp/sg_fire[sg_fire].wav",
} )

sound.Add( {
	name = "GH3.Shotgun.Ready",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/shotgun/shotgun_fp/sg_ready[sg_ready1].wav",
		")gh3/shotgun/shotgun_fp/sg_ready[sg_ready2].wav",
		")gh3/shotgun/shotgun_fp/sg_ready[sg_ready3].wav",
	}
} )

sound.Add( {
	name = "GH3.Shotgun.Melee1",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/shotgun/shotgun_fp/sg_melee1[sg_melee1_a].wav",
		")gh3/shotgun/shotgun_fp/sg_melee1[sg_melee1_b].wav",
		")gh3/shotgun/shotgun_fp/sg_melee1[sg_melee1_c].wav"
	}
} )

sound.Add( {
	name = "GH3.Shotgun.Melee2",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/shotgun/shotgun_fp/sg_melee2[sg_melee2_a].wav",
		")gh3/shotgun/shotgun_fp/sg_melee2[sg_melee2_b].wav",
		")gh3/shotgun/shotgun_fp/sg_melee2[sg_melee2_c].wav"
	}
} )

---- Support

-- Machine Gun Turret

sound.Add( {
	name = "GH3.MachineGunTurret.Fire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/machinegun_turret/machine_gun_turret_fire[machine_gun_turret_fire1].wav",
		")gh3/machinegun_turret/machine_gun_turret_fire[machine_gun_turret_fire2].wav",
		")gh3/machinegun_turret/machine_gun_turret_fire[machine_gun_turret_fire3].wav",
	}
} )

-- Missile Pod

sound.Add( {
	name = "GH3.MissilePod.Fire",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/missile_launcher/missile_launch[missile_launch1].wav",
		")gh3/missile_launcher/missile_launch[missile_launch2].wav",
		")gh3/missile_launcher/missile_launch[missile_launch3].wav",
		")gh3/missile_launcher/missile_launch[missile_launch4].wav",
	},
} )

sound.Add( {
	name = "GH3.Missile.Ignite",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/missile_launcher/missile_fire[missile_fire1].wav",
		")gh3/missile_launcher/missile_fire[missile_fire2].wav",
		")gh3/missile_launcher/missile_fire[missile_fire3].wav",
		")gh3/missile_launcher/missile_fire[missile_fire4].wav",
	},
} )

sound.Add( {
	name = "GH3.Missile.Explode",
	channel = CHAN_STATIC,
	volume = 1,
	level = 80,
	pitch = pn,
	sound = {
		")gh3/h3_lrg_explosion[h3_lrg_expl1].wav",
		")gh3/h3_lrg_explosion[h3_lrg_expl2].wav",
		")gh3/h3_lrg_explosion[h3_lrg_expl3].wav",
		")gh3/h3_lrg_explosion[h3_lrg_expl4].wav",
	},
} )

sound.Add( {
	name = "GH3.Missile.ExplodeFar",
	channel = CHAN_STATIC,
	volume = 1,
	level = 165,
	pitch = pn,
	sound = {
		")gh3/h3_dist_explosion[h3_dist_expl1].wav",
		")gh3/h3_dist_explosion[h3_dist_expl2].wav",
	}
} )

sound.Add( {
	name = "GH3.Missile.Loop",
	channel = CHAN_STATIC,
	volume = 1,
	level = 60,
	pitch = pn,
	sound = {
		")gh3/missile_launcher/missile_proj/missile_proj/loop[missile_proj_loop].wav",
	}
} )

---- Multiplayer
-- Ball

sound.Add( {
	name = "GH3.MP_Ball.Posing1",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/ball/ball_posing_var0[ball_posing_var0_01].wav",
		")gh3/ball/ball_posing_var0[ball_posing_var0_02].wav",
		")gh3/ball/ball_posing_var0[ball_posing_var0_03].wav"
	}
} )

sound.Add( {
	name = "GH3.MP_Ball.Posing2",
	channel = CHAN_ITEM,
	volume = 0.3,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/ball/ball_posing_var1[ball_posing_var1_01].wav",
		")gh3/ball/ball_posing_var1[ball_posing_var1_02].wav",
	}
} )

sound.Add( {
	name = "GH3.MP_Ball.Ready",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/ball/ball_ready[ball_ready].wav",
		")gh3/ball/ball_ready[ball_ready1].wav",
		")gh3/ball/ball_ready[ball_ready2].wav",
	}
} )

sound.Add( {
	name = "GH3.MP_Ball.Putaway",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/ball/ball_put_away[ball_put_away_01].wav",
		")gh3/ball/ball_put_away[ball_put_away_02].wav",
		")gh3/ball/ball_put_away[ball_put_away_03].wav",
	}
} )

sound.Add( {
	name = "GH3.MP_Ball.Melee1",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/ball/ball_melee_var1[melee1_1].wav",
		")gh3/ball/ball_melee_var1[melee1_2].wav",
		")gh3/ball/ball_melee_var1[melee1_3].wav"
	}
} )

sound.Add( {
	name = "GH3.MP_Ball.Melee2",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/ball/ball_melee_var2[melee2_1].wav",
		")gh3/ball/ball_melee_var2[melee2_2].wav",
		")gh3/ball/ball_melee_var2[melee2_3].wav"
	}
} )

sound.Add( {
	name = "GH3.MP_Ball.Melee3",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/ball/ball_melee_var3[melee3_1].wav",
		")gh3/ball/ball_melee_var3[melee3_2].wav",
		")gh3/ball/ball_melee_var3[melee3_3].wav"
	}
} )

-- Grenades

sound.Add( {
	name = "GH3.Gren.Frag",
	channel = CHAN_ITEM,
	volume = g_vol,
	level = 75,
	pitch = pn,
	sound = {
		")gh3/frag_grenade/frag_throw[frag_throw].wav",
	}
} )

sound.Add( {
	name = "GH3.Gren.Frag.Explode",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/frag_grenade/frag_expl[frag_expl_h3_1].wav",
		")gh3/frag_grenade/frag_expl[frag_expl_h3_2].wav",
		")gh3/frag_grenade/frag_expl[frag_expl_h3_3].wav",
		")gh3/frag_grenade/frag_expl[frag_expl_h3_4].wav",
		")gh3/frag_grenade/frag_expl[frag_expl_h3_5].wav",
		")gh3/frag_grenade/frag_expl[frag_expl_h3_6].wav",
		")gh3/frag_grenade/frag_expl[frag_expl1].wav",
		")gh3/frag_grenade/frag_expl[frag_expl2].wav",
		")gh3/frag_grenade/frag_expl[frag_expl3].wav",
		")gh3/frag_grenade/frag_expl[new_frag_explo1].wav",
		")gh3/frag_grenade/frag_expl[new_frag_explo2].wav",
		")gh3/frag_grenade/frag_expl[new_frag_explo3].wav",
		")gh3/frag_grenade/frag_expl[new_frag_explo4].wav",
	}
} )

sound.Add( {
	name = "GH3.Gren.Frag.ExplodeWater",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/frag_grenade/frag_expl_water[frag_expl_water1].wav",
		")gh3/frag_grenade/frag_expl_water[frag_expl_water2].wav",
		")gh3/frag_grenade/frag_expl_water[frag_expl_water3].wav",
		")gh3/frag_grenade/frag_expl_water[frag_expl_water4].wav",
		")gh3/frag_grenade/frag_expl_water[frag_expl_water5].wav",
	}
} )

sound.Add( {
	name = "GH3.Gren.Frag.Collide.Metal",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/frag_grenade/frag_bnc_metal[frag_bnc_metal1].wav",
		")gh3/frag_grenade/frag_bnc_metal[frag_bnc_metal2].wav",
		")gh3/frag_grenade/frag_bnc_metal[frag_bnc_metal3].wav",
		")gh3/frag_grenade/frag_bnc_metal[frag_bnc_metal4].wav",
	}
} )

sound.Add( {
	name = "GH3.Gren.Frag.Collide.Dirt",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/frag_grenade/frag_bnc_dirt[frag_bnc_dirt].wav",
		")gh3/frag_grenade/frag_bnc_dirt[frag_bnc_dirt1].wav",
		")gh3/frag_grenade/frag_bnc_dirt[frag_bnc_dirt2].wav",
	}
} )

sound.Add( {
	name = "GH3.Gren.Frag.Collide.Stone",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = pn,
	sound = {
		")gh3/frag_grenade/frag_bnc_stone[frag_bnc_stone1].wav",
		")gh3/frag_grenade/frag_bnc_stone[frag_bnc_stone2].wav",
		")gh3/frag_grenade/frag_bnc_stone[frag_bnc_stone3].wav",
	}
} )