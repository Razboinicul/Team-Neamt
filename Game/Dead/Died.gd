extends Control

func _ready():
	$Label2.text = "Score: "+str(global.wood)

func _on_Button_pressed():
	get_tree().change_scene("res://Main Menu/Main Menu.tscn")
