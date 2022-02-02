extends Node2D

onready var animation_transition: AnimationPlayer = $Transition/AnimationPlayer
var play = false

func _ready():
	animation_transition.play("fade_out")
	yield(animation_transition, "animation_finished")
	play = !play
	$Background.play = play
	start_animation_group('swimmers', 'swimming')

func _physics_process(delta):
	if play:
		var speed_player = $Background.speed
		if speed_player > 100:
			if $swimmer.position.x > 180 :
				$swimmer.position.x -=  100 * delta
			if $swimmer2.position.x > 300 :
				$swimmer2.position.x -=  80 * delta
			if $swimmer3.position.x > 400 :
				$swimmer3.position.x -=  60 * delta
		else:
			$swimmer.position.x +=  60 * delta	
			$swimmer2.position.x +=  80 * delta
			$swimmer3.position.x +=  100 * delta

func _on_Timer_timeout():
	if $Player.global_position.x < $swimmer.position.x:
		$"/root/Settings".final_position = 4
	elif $Player.global_position.x < $swimmer2.position.x:
		$"/root/Settings".final_position = 3
	elif $Player.global_position.x < $swimmer3.position.x:
		$"/root/Settings".final_position = 2
	else:
		$"/root/Settings".final_position = 1
	print($"/root/Settings".final_position)
	animation_transition.play("fade_in")
	yield(animation_transition, "animation_finished")
	get_tree().change_scene("res://src/Scene/Swim/EndLevel.tscn")

func start_animation_group(nameGroup, nameAnimation):
	var nodes = get_tree().get_nodes_in_group(nameGroup)
	for x in nodes:
		x.start = true
