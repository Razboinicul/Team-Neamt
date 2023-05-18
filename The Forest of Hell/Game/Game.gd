extends Spatial

var tree_preload = preload("res://Assets/Tree/Tree.tscn")
func _ready():
	$Label.show()
	var rng = RandomNumberGenerator.new()
	var rn_tree = rng.randi_range(1000, 2000)
	var count = 0
	while count <= rn_tree:
		var tree = tree_preload.instance()
		var _x = rng.randf_range(-217, 217)
		var _z = rng.randf_range(-217, 217)
		$Trees.add_child(tree)
		tree.transform.origin = Vector3(_x, 0.5, _z)
		count+=1
	$Label.hide()
