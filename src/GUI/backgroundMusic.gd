extends Node2D

func _ready():
	play_background_music()

func play_background_music():
	if $"/root/SoundConfig".enable_music:
		$backgroundMusic.play()
	else:
		$backgroundMusic.stop()
	
