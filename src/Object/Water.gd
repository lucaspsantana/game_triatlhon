extends Area2D

func start(pos):
	global_position = pos

func _on_Water_body_entered():
	$"/root/Settings".dash = 1
	queue_free();
