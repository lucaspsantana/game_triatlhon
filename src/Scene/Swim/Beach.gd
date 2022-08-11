extends Node2D

onready var animation_transition: AnimationPlayer = $Transition/AnimationPlayer
var play = false
var distance = 0.0
	
func _ready():
	animation_transition.play("fade_out")
	yield(animation_transition, "animation_finished")
	play = !play
	$Background.play = play
	play_start_beep()
	start_animation_group('swimmers', true)
	play_wave_song()

func _physics_process(delta):
	if play:
		var speed_player = $Background.speed
		if speed_player > 120:
			if $swimmer.position.x > 180 :
				$swimmer.position.x -=  50 * delta
			if $swimmer2.position.x > 300 :
				$swimmer2.position.x -=  40 * delta
			if $swimmer3.position.x > 400 :
				$swimmer3.position.x -=  30 * delta
		else:
			$swimmer.position.x +=  80 * delta	
			$swimmer2.position.x +=  100 * delta
			$swimmer3.position.x +=  120 * delta
		$Score.setValueScore(distance, speed_player * 0.2, $Timer.time_left)
		distance += 0.01
		#print("speed player ", speed_player)

func _on_Timer_timeout():
	$Timer.stop()
	start_animation_group('swimmers', false)
	if $Player.global_position.x < $swimmer.global_position.x:
		$"/root/Settings".final_position = 4
	elif $Player.global_position.x < $swimmer2.global_position.x:
		$"/root/Settings".final_position = 3
	elif $Player.global_position.x < $swimmer3.global_position.x:
		$"/root/Settings".final_position = 2
	else:
		$"/root/Settings".final_position = 1
	#print($"/root/Settings".final_position)
	animation_transition.play("fade_in")
	yield(animation_transition, "animation_finished")
	get_tree().change_scene("res://src/Scene/Swim/EndLevel.tscn")

func start_animation_group(nameGroup, start):
	var nodes = get_tree().get_nodes_in_group(nameGroup)
	for x in nodes:
		x.start = start
		
func play_wave_song():
	if $"/root/SoundConfig".enable_music:
		$wave.play()

func play_start_beep():
	if $"/root/SoundConfig".enable_sound:
		$startBeep.play()
