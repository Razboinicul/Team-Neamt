extends KinematicBody

var rng = RandomNumberGenerator.new()
var col: Array
var hits = 0
var wanted_hits: int
var stone: int
func _on_Area_area_entered(area):
	if area.name == "Stone":
		area.queue_free()
	if area.name == "Tree":
		area.queue_free()
	if area.name == "Water":
		queue_free()
	if area.name == "Axe":
		col.append(area)
	if area.name == "House":
		queue_free()

func _process(delta):
	if global.pickaxe_attack and col != []:
		hits+=1
	if hits == wanted_hits:
		global.stone += stone
		print(global.stone)
		queue_free()

func _on_Area_area_exited(area):
	if area.name == "Axe":
		col.pop_at(0)
