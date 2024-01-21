extends Control

var sample_pos = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureProgressBar.max_value = $AudioStreamPlayer.stream.get_length()
	$TextureProgressBar.step = 0.01

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AudioStreamPlayer.is_playing():
		$TextureProgressBar.value = $AudioStreamPlayer.get_playback_position()
		$TimeLabel.text = format_time($AudioStreamPlayer.get_playback_position())

func _on_button_pressed():
	if not $AudioStreamPlayer.is_playing():
		$AudioStreamPlayer.play(sample_pos)
	else:
		sample_pos = $AudioStreamPlayer.get_playback_position()
		$AudioStreamPlayer.stop()

func format_time(seconds):
	var minutes = int(seconds / 60)
	var remaining_seconds = int(seconds) % 60
	return str(minutes).pad_zeros(1) + ":" + str(remaining_seconds).pad_zeros(2)
