extends Area

var rng = RandomNumberGenerator.new()
var col: Array
var hits = 0
var wanted_hits: int
var wood: int
func _on_Area_area_entered(area):
	if area.name == "Tree":
		area.queue_free()
	if area.name == "Axe":
		col.append(area)

func _process(delta):
	if global.axe_attack and col != []:
		hits+=1
	if hits == wanted_hits:
		global.wood += wood
		print(global.wood)
		queue_free()

func _on_Area_area_exited(area):
	if area.name == "Axe":
		col.pop_at(0)
