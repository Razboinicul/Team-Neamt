extends Spatial

var tree_preload = preload("res://Assets/Tree/Tree.tscn")
var fast_renderer = true
var experimental = false
func _ready():
	generate_trees()
	pass

func _process(delta):
	$UI/Wood.text = "Wood: "+str(global.wood)
	$UI/FPS.text = "FPS: "+str(Engine.get_frames_per_second())

func generate_trees():
	var rng = RandomNumberGenerator.new()
	var rn_tree = null
	if not fast_renderer: rn_tree = rng.randi_range(1000, 2000)
	else: rn_tree = rng.randi_range(500, 1000)
	var count = 0
	if not experimental:
		while count <= rn_tree:
			var tree = tree_preload.instance()
			var _x = rng.randf_range(-217, 217)
			var _z = rng.randf_range(-217, 217)
			tree.wanted_hits = rng.randi_range(2, 6)
			tree.wood = rng.randi_range(2, 6)
			$Trees.add_child(tree)
			tree.transform.origin = Vector3(_x, 0.5, _z)
			count+=1
	if experimental:
		for i in range(0, rn_tree):
			var tree = tree_preload.instance()
			var _x = rng.randf_range(-217, 217)
			var _z = rng.randf_range(-217, 217)
			$Trees.add_child(tree)
			tree.transform.origin = Vector3(_x, 0.5, _z)
