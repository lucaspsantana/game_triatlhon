extends "res://src/Object/Object.gd"

func _on_Water_body_entered(body):
	detect_colision($ObjectSound/AudioStreamPlayer)
