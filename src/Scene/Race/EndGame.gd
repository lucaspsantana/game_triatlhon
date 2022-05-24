extends Control

#func _ready():
#	var final_position = $"/root/Settings".final_position
#	#$Msg.text = "Parabéns! Chegou em "+ str(final_position)+"º"

func _on_Again_pressed():
	get_tree().change_scene("res://src/Scene/Swim/Beach.tscn");
