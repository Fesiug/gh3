
$modelname "gh3/proj/rocket launcher projectile.mdl"
$scale 1
$origin 0 0 0 -90

$cdmaterials "gh3\rocket launcher"

$attachment "exhaust" "exhaust" 0 0 0 rotate 0 180 0

$bodygroup "ref"
{
	studio "standard_standard.smd"
}
$collisionmodel "standard_standard.smd"

$sequence "idle" {
	"standard_standard.smd"
	fps 30
}