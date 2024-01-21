extends TextureProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.interpolate_property(
	$TextureProgressBar,
	"value",
	$TextureProgressBar.value,
	$AudioStreamPlayer.get_playback_position(),
	1.0,  # Duration in seconds
	Tween.TRANS_LINEAR,  # Easing function (linear for a smooth progression)
	Tween.EASE_IN_OUT  # Easing type (in and out for a more natural look)
)
#	pass	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
