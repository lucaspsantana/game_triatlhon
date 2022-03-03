extends Control

func _ready():
	var final_position = $"/root/Settings".final_position
	$Msg.text = "Parabéns! Chegou em "+ str(final_position)+"º"
