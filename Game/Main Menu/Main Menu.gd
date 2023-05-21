extends Control

var pressed = 0
var exit_pressed = 0
func _on_Play_pressed():
	get_tree().change_scene("res://Game/Game.tscn")

func _on_Exit_pressed():
	exit_pressed += 1
	if not global.tester:
		get_tree().quit()
	else:
		if exit_pressed >= 3:
			get_tree().quit()
		else:
			$Exit.text = "No"

func _on_Options_pressed():
	if not global.tester:
		get_tree().change_scene("res://Main Menu/Options.tscn")
	else:
		$Options.text = "No"


func _on_Button_pressed():
	pressed += 1
	if pressed >= 10: $Button.text = "Stop"
	if pressed >= 15: $Button.text = "STOP"
	if pressed >= 25: 
		$Button.text = "You should've stopped!"
		global.tester = true
