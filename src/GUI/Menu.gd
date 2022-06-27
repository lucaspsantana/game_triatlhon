extends Control

func _on_Settings_pressed():
	get_tree().change_scene("res://src/GUI/Settings.tscn")

func _on_Start_pressed():
	get_tree().change_scene("res://src/Scene/Swim/Beach.tscn")
