extends Area2D

func start(pos):
	global_position = pos

func _on_Mosquito_body_entered(body):
	$"/root/Settings".dano = 1
	queue_free();