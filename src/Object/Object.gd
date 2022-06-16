extends Area2D

export (String, "obstacle", "collectable") var object_type = "collectable"
var audioStreamSample: AudioStreamSample

func start(pos):
	global_position = pos

func detect_colision(sound: AudioStreamPlayer):
	visible = false
	if object_type == "obstacle":
		audioStreamSample = load("res://assets/sounds/obstacle.wav")
		$"/root/Settings".dano = 1
	else:
		audioStreamSample = load("res://assets/sounds/collect-5.wav")
		$"/root/Settings".dash = 1
	sound.stream = audioStreamSample
	sound.play()
	yield(sound, "finished")
	queue_free()
