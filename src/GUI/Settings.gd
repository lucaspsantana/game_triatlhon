extends Control
onready var animation: AnimationPlayer = $AnimationPlayer
var musicButton = {
	true: preload("res://assets/sprite/musicON.png"),
	false: preload("res://assets/sprite/musicOFF.png")
	}
var soundButton = {
	true: preload("res://assets/sprite/soundON.png"), 
	false: preload("res://assets/sprite/soundOFF.png")
	}

func _ready():
	animation.play("pulse")

func _on_TextureButton_pressed():
	get_tree().change_scene("res://src/GUI/Menu.tscn")

func _on_MusicButton_pressed():
	$"/root/SoundConfig".enable_music = !$"/root/SoundConfig".enable_music
	$MusicButton.texture_normal = musicButton[$"/root/SoundConfig".enable_music]
	print($"/root/SoundConfig".enable_music)
	$BackgroundMusic.play_background_music()

func _on_SoundButton_pressed():
	$"/root/SoundConfig".enable_sound = !$"/root/SoundConfig".enable_sound
	$SoundButton.texture_normal = soundButton[$"/root/SoundConfig".enable_sound]
	verifyConfigSound()
	
func verifyConfigSound():
	if $"/root/SoundConfig".enable_sound:
		$Click.play()
