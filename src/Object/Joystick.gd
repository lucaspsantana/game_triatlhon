extends CanvasLayer

func _on_left_button_up():
	$"/root/Settings".swim += 50
	$"/root/Settings".pedal += 100

func _on_right_button_up():
	$"/root/Settings".swim += 50
	$"/root/Settings".pedal += 100
