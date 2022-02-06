extends Node2D

onready var animation: AnimationPlayer = $AnimationPlayer

func _on_quit_pressed():
	print("pressionou")
	animation.play("fade-out")
	yield(animation, "animation_finished")
	$InicialMessage.queue_free()
	#$InicialMessage.layer = -10
	$Player/AnimatedSprite.play("idle")
	animation.play("button_fade-in");

func _on_start_button_down():
	print("start pressionado")
	get_tree().change_scene("res://src/Scene/Cyclism/BikeLane.tscn")
