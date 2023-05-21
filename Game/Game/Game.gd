extends Spatial

var tree_preload = preload("res://Assets/Tree/Tree.tscn")
var stone_preload = preload("res://Assets/Stone/Stone.tscn")
var fast_renderer = global.fast_rendering
var experimental = global.experiments
var development = global.development
func _ready():
	generate_trees()
	generate_stones()

func _input(event):
	pass

func _process(delta):
	$UI/Wood.text = "Wood: "+str(global.wood)
	$UI/Stone.text = "Stone: "+str(global.stone)
	$UI/FPS.text = "FPS: "+str(Engine.get_frames_per_second())

func generate_stones():
	var rng = RandomNumberGenerator.new()
	var rn_tree = null
	if not fast_renderer: rn_tree = rng.randi_range(200, 400)
	else: rn_tree = rng.randi_range(150, 300)
	if development: rn_tree = 10
	var count = 0
	if not experimental:
		while count <= rn_tree:
			var _x = rng.randf_range(-590, 590)
			var stone = stone_preload.instance()
			stone.wanted_hits = rng.randi_range(2, 6)
			stone.stone = rng.randi_range(2, 6)
			$Trees.add_child(stone)
			var _z = rng.randf_range(-590, 590)
			stone.transform.origin = Vector3(_x, 0.4, _z)
			count+=1
	if experimental:
		for i in range(0, rn_tree):
			var _x = rng.randf_range(-590, 590)
			var stone = stone_preload.instance()
			stone.wanted_hits = rng.randi_range(2, 6)
			stone.stone = rng.randi_range(2, 6)
			$Trees.add_child(stone)
			var _z = rng.randf_range(-590, 590)
			stone.transform.origin = Vector3(_x, 0.4, _z)

func generate_trees():
	var rng = RandomNumberGenerator.new()
	var rn_tree = null
	if not fast_renderer: rn_tree = rng.randi_range(2000, 3000)
	else: rn_tree = rng.randi_range(1500, 2500)
	if development: rn_tree = 10
	var count = 0
	if not experimental:
		while count <= rn_tree:
			var tree = tree_preload.instance()
			rng.randomize()
			var _x = rng.randf_range(-590, 590)
			rng.randomize()
			var _z = rng.randf_range(-590, 590)
			rng.randomize()
			tree.wanted_hits = rng.randi_range(2, 6)
			rng.randomize()
			tree.wood = rng.randi_range(2, 6)
			$Trees.add_child(tree)
			tree.transform.origin = Vector3(_x, 0.5, _z)
			count+=1
	if experimental:
		for i in range(0, rn_tree):
			var tree = tree_preload.instance()
			rng.randomize()
			var _x = rng.randf_range(-590, 590)
			rng.randomize()
			var _z = rng.randf_range(-590, 590)
			rng.randomize()
			tree.wanted_hits = rng.randi_range(2, 6)
			rng.randomize()
			tree.wood = rng.randi_range(2, 6)
			$Trees.add_child(tree)
			tree.transform.origin = Vector3(_x, 0.5, _z)

func _on_Timer_timeout():
	global.night = !global.night
	if global.night:
		$WorldEnvironment.environment.ambient_light_energy = 0.1
		$WorldEnvironment.environment.background_energy = 0.1
	else:
		global.days += 1
		print(global.days)
		$WorldEnvironment.environment.ambient_light_energy = 1
		$WorldEnvironment.environment.background_energy = 1
	$Timer.wait_time = 15
	$Timer.start()
	
	
