extends Control

func _ready():
	$FastRendering.pressed = global.fast_rendering
	$Experiments.pressed = global.experiments

func _on_Exit_pressed():
	global.fast_rendering = $FastRendering.toggle_mode
	global.experiments = $Experiments.toggle_mode
	get_tree().change_scene("res://Main Menu/Main Menu.tscn")
