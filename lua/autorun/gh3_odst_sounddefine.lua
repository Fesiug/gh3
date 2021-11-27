

hook.Add("PlayerScaleDamage", "a", function( ply, hitgroup, dmginfo )
	local sca = 1
	if sndbo[hitgroup] then sca = sndbo[hitgroup] end
	dmginfo:SetDamage( dmginfo:GetDamage() * sca )
end)

local pn = {100, 100}
local g_vol = 0.5

-- Automag

sound.Add( {
	name = "GH3.Automag.Fire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3_odst/magnum/silenced_mag3_w_tails[magnum_silenced9].wav",
		")gh3_odst/magnum/silenced_mag3_w_tails[magnum_silenced10].wav",
		")gh3_odst/magnum/silenced_mag3_w_tails[magnum_silenced11].wav",
		")gh3_odst/magnum/silenced_mag3_w_tails[magnum_silenced12].wav",
	}
} )

sound.Add( {
	name = "GH3.Automag.Tail_EXT",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3_odst/magnum/silenced_magnum_tails_ext[silenced_magnum_tail_ext1].wav",
		")gh3_odst/magnum/silenced_magnum_tails_ext[silenced_magnum_tail_ext2].wav",
		")gh3_odst/magnum/silenced_magnum_tails_ext[silenced_magnum_tail_ext3].wav",
	}
} )

sound.Add( {
	name = "GH3.Automag.Tail_INT",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3_odst/magnum/silenced_magnum_tails_int[silenced_magnum_tail_int1].wav",
		")gh3_odst/magnum/silenced_magnum_tails_int[silenced_magnum_tail_int2].wav",
		")gh3_odst/magnum/silenced_magnum_tails_int[silenced_magnum_tail_int3].wav",
	}
} )


-- Silenced SMG

sound.Add( {
	name = "GH3.SMG_Silenced.Fire",
	channel = CHAN_STATIC,
	volume = g_vol,
	level = 140,
	pitch = pn,
	sound = {
		")gh3_odst/smg/smg_recon[smg_recon1].wav",
		")gh3_odst/smg/smg_recon[smg_recon2].wav",
		")gh3_odst/smg/smg_recon[smg_recon3].wav",
	}
} )

sound.Add( {
	name = "GH3.SMG_Silenced.Fire2",
	channel = CHAN_STATIC,
	volume = g_vol*0.5,
	level = 140,
	pitch = pn,
	sound = {
		")gh3_odst/smg/fire_silenced3[mac_10_1a].wav",
		")gh3_odst/smg/fire_silenced3[mac_10_2a].wav",
		")gh3_odst/smg/fire_silenced3[mac_10_3a].wav",
	}
} )