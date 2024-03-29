extends Node2D

onready var animation_transition: AnimationPlayer = $Transition/AnimationPlayer
var play = false 
var time = 0.0
var obstacules 
var distance = 0

func _ready():
	var current_position =  $"/root/Settings".final_position 
	$ParallaxBackground.speed = 500
	match current_position:
		4:
			$Player/Player.global_position.x = 120
		3:
			$Player/Player.global_position.x = 440
		2:
			$Player/Player.global_position.x = 550
		1:
			$Player/Player.global_position.x = 650
	animation_transition.play("fade_out")
	yield(animation_transition, "animation_finished")
	play = !play
	$ParallaxBackground.play = play
	#start_animation_group("marathonist")

func _process(delta):
	time += 1 * delta
	if time > 5:
		#print("criou")
		var node = preload("res://src/Object/Obstacules.tscn")
		var scene = node.instance()
		get_parent().add_child(scene)
		time = 0
	var speed_player = $ParallaxBackground.speed
	if speed_player > 500:
		if $Marathonist.position.x > 150 :
			$Marathonist.position.x -=  100 * delta
		if $Marathonist2.position.x > 180 :
			$Marathonist2.position.x -=  80 * delta
		if $Marathonist3.position.x > 250 :
			$Marathonist3.position.x -=  60 * delta
		#if $Player/Player.global_position.x < 60:
		$Player/Player.global_position.x += 100 * delta
		if $Player/Player.global_position.x > 700:
			$Player/Player.global_position.x = 700
		#print($Player/Player.global_position)
	else:
		$Marathonist.position.x +=  50 * delta	
		$Marathonist2.position.x +=  70 * delta
		$Marathonist3.position.x +=  90 * delta
	if $"/root/Settings".dano:
		$ParallaxBackground.speed = 550
	if $"/root/Settings".dash:
		$ParallaxBackground.speed = 700
	$"/root/Settings".parallax_speed_obstacule = $ParallaxBackground.speed
	$Score.setValueScore(distance, speed_player * 0.1, $Timer.time_left)
	distance += 0.01

func _on_Timer_timeout():
	$Timer.stop()
	$"/root/Settings".final_position = get_runner_position()
	#print("final position " + str($"/root/Settings".final_position))
	animation_transition.play("fade_in")
	yield(animation_transition, "animation_finished")
	var obstaculeNode = get_tree().get_nodes_in_group("obstacule")
	for n in obstaculeNode:
		n.free()
	get_tree().change_scene("res://src/Scene/Race/EndGame.tscn")
	
func get_runner_position():
	if $Player.global_position.x < $Marathonist.global_position.x:
		return 4
	elif $Player.global_position.x < $Marathonist2.global_position.x:
		return 3
	elif $Player.global_position.x < $Marathonist3.global_position.x:
		return 2
	return 1
		
#func start_animation_group(nameGroup):
#	var nodes = get_tree().get_nodes_in_group(nameGroup)
#	for x in nodes:
#		x.start = true
