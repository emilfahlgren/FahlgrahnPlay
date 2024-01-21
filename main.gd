extends Control

var sample_pos = 0.0
var is_playing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureProgressBar.max_value = $AudioStreamPlayer.stream.get_length()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_playing:
		$TextureProgressBar.value = $AudioStreamPlayer.get_playback_position()

func _on_button_pressed():
	if not is_playing:
		$AudioStreamPlayer.play(sample_pos)
		is_playing = true
	else:
		sample_pos = $AudioStreamPlayer.get_playback_position()
		$AudioStreamPlayer.stop()
		is_playing = false
