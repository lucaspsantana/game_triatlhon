extends Node2D

onready var animation: AnimationPlayer = $AnimationPlayer

func _on_Button_pressed():
	get_tree().change_scene("res://src/Scene/Cyclism/BikeLane.tscn")

func _on_quit_pressed():
	animation.play("fade-out")
	yield(animation, "animation_finished")
	$InicialMessage.layer = -10
	$Player/AnimatedSprite.play("idle")
	animation.play("button_fade-in");
