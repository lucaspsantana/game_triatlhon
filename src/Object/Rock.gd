extends Area2D

func start(pos):
	global_position = pos

func _on_Rock_body_entered():
	$"/root/Settings".dano = 1
	queue_free();
