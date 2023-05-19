extends Spatial

var tree_preload = preload("res://Assets/Tree/Tree.tscn")
var stone_preload = preload("res://Assets/Stone/Stone.tscn")
var fast_renderer = true
var experimental = false
func _ready():
	generate_trees()
	generate_stones()

func _input(event):
	if Input.is_action_pressed("attack"):
		if global.tool == 2:
			$Player/Camera/Pickaxe.mine()
	else:
		if global.tool == 2:
			$Player/Camera/Pickaxe.dont_mine()
	if Input.is_action_pressed("attack"):
		if global.tool == 1:
			$Player/Camera/Axe.rotation.x = 25
			$Player/Camera/Axe.rotation.z = 35
			global.axe_attack = true
	else: 
		$Player/Camera/Axe.rotation.x = 0
		$Player/Camera/Axe.rotation.z = 0
		global.axe_attack = false

func _process(delta):
	$UI/Wood.text = "Wood: "+str(global.wood)
	$UI/Stone.text = "Stone: "+str(global.stone)
	$UI/FPS.text = "FPS: "+str(Engine.get_frames_per_second())

func generate_stones():
	var rng = RandomNumberGenerator.new()
	var rn_tree = null
	if not fast_renderer: rn_tree = rng.randi_range(100, 250)
	else: rn_tree = rng.randi_range(50, 150)
	var count = 0
	if not experimental:
		while count <= rn_tree:
			var _x = rng.randf_range(-217, 217)
			var stone = stone_preload.instance()
			stone.wanted_hits = rng.randi_range(2, 6)
			stone.stone = rng.randi_range(2, 6)
			$Trees.add_child(stone)
			var _z = rng.randf_range(-217, 217)
			stone.transform.origin = Vector3(_x, 0.4, _z)
			count+=1
	if experimental:
		for i in range(0, rn_tree):
			var _x = rng.randf_range(-217, 217)
			var stone = stone_preload.instance()
			stone.wanted_hits = rng.randi_range(2, 6)
			stone.wood = rng.randi_range(2, 6)
			$Trees.add_child(stone)
			var _z = rng.randf_range(-217, 217)
			stone.transform.origin = Vector3(_x, 0.4, _z)

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
