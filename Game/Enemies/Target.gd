extends KinematicBody

var rng = RandomNumberGenerator.new()
var col: Array
var player = {}
var hits = 0
var runspeed = 8
var wanted_hits: int = rng.randi_range(50, 100)
var pa = false

func _ready():
	player["Touching"] = false
	if global.tester: runspeed = 1000

func _on_Area_area_entered(area):
	if area.name == "Axe":
		col.append(area)
	if area.name == "Player":
		pa = true

func _process(delta):
	if pa:
		global.target_attack = true
		player["Object"].hits += 1
	else:
		global.target_attack = false
	if player["Touching"]:
		var velocity = Vector3.ZERO
		if not is_on_floor(): velocity.y -= 2
		look_at(player["Object"].global_translation, Vector3.UP)
		velocity = (player["Object"].global_translation-global_translation).normalized()*runspeed
		move_and_slide(velocity, Vector3.UP)
	if global.axe_attack and col != []:
		hits+=1
	if hits == wanted_hits:
		queue_free()

func _on_Area_area_exited(area):
	if area.name == "Axe":
		col.pop_at(0)
	if area.name == "Player":
		pa = false


func _on_Area2_area_entered(area):
	if area.name == "Player":
		player["Object"] = area
		player["Position"] = area.global_translation
		player["Touching"] = true


func _on_Area2_area_exited(area):
	if area.name == "Player":
		player["Object"] = area
		player["Position"] = area.global_translation
		player["Touching"] = false
