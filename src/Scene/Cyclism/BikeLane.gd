extends Node2D

onready var animation: AnimationPlayer = $Transition/AnimationPlayer
var play = false

func _ready():
	var current_position =  $"/root/Settings".final_position 
	$ParallaxBackground.speed = 600
	match current_position:
		4:
			$Player.global_position.x = 120
		3:
			$Player.global_position.x = 160
		2:
			$Player.global_position.x = 200
		1:
			$ParallaxBackground.speed = 700
	animation.play("fade_out")
	yield(animation, "animation_finished")
	play = !play
	$ParallaxBackground.play = play
	$Player/AnimatedSprite.play("pedal")

func _physics_process(delta):
	if play:
		var speed_player = $ParallaxBackground.speed
		if speed_player > 600:
			if $cyclist.position.x > 150 :
				$cyclist.position.x -=  100 * delta
			if $cyclist2.position.x > 180 :
				$cyclist2.position.x -=  80 * delta
			if $cyclist3.position.x > 250 :
				$cyclist3.position.x -=  60 * delta
			if $Player.global_position.x < 900:
				$Player.global_position.x += 100 * delta
				if $Player.global_position.x > 900:
					$Player.global_position.x = 900
		else:
			$cyclist.position.x +=  60 * delta	
			$cyclist2.position.x +=  80 * delta
			$cyclist3.position.x +=  100 * delta

func _on_Timer_timeout():
	if $Player.global_position.x < $cyclist.position.x:
		$"/root/Settings".final_position = 4
	elif $Player.global_position.x < $cyclist2.position.x:
		$"/root/Settings".final_position = 3
	elif $Player.global_position.x < $cyclist3.position.x:
		$"/root/Settings".final_position = 2
	else:
		$"/root/Settings".final_position = 1
	print($"/root/Settings".final_position)
	animation.play("fade_in")
	yield(animation, "animation_finished")
	get_tree().change_scene("res://src/Scene/Race/Speedway.tscn")
			
