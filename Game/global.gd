extends Node

var axe_attack = false
var pickaxe_attack = false
var wood = 0
var tool = 1
var stone = 0
var fast_rendering = true
var experiments = false
var development = true
var days = 1
var night = true
var target_attack = false
var tester = false

func _ready():
	if development:
		wood = 10000
		stone = 10000
