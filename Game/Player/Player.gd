extends KinematicBody

var LOOK_SPEED = 0.8
var SPEED = 400
var FALL_SPEED = 400
var JUMP_SPEED = 420
var mouse_sens = 0.3
var camera_anglev=0
var rot = 0
var last_wood = 0
var friction = true
var tool = 1
var jumping = false
var frame = 0
var rng = RandomNumberGenerator.new()
var col: Array
var hits = 0
var wanted_hits: int = 150
func _process(delta):
	if global.wood >= last_wood+1000:
		var enemy = preload("res://Enemies/Target.tscn").instance()
		rng.randomize()
		var _x = global_translation.x+rng.randf_range(-1, 15)
		rng.randomize()
		var _z = global_translation.z+rng.randf_range(-1, 15)
		get_owner().add_child(enemy)
		enemy.transform.origin = Vector3(_x, 0.5, _z)
		last_wood += 1000
	if hits == wanted_hits:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_owner().get_node("Died").show()
		queue_free()

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x*mouse_sens))
		var changev=-event.relative.y*mouse_sens
		if camera_anglev+changev>-50 and camera_anglev+changev<50:
			camera_anglev+=changev
			$Camera.rotate_x(deg2rad(changev))
	#if Input.is_action_pressed("attack"):
		#if global.tool == 2:
			#$Camera/Pickaxe.mine()
	#else:
		#if global.tool == 2:
			#$Camera/Pickaxe.dont_mine()
	if Input.is_action_pressed("attack"):
		if global.tool == 1:
			$Camera/Axe.rotation.x = 25
			global.axe_attack = true
	else: 
		$Camera/Axe.rotation.x = 0
		global.axe_attack = false


func _physics_process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	var velocity = Vector3.ZERO
	if Input.is_action_pressed("ui_end"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://Main Menu/Main Menu.tscn")
	if not is_on_floor() and not jumping: velocity.y -= FALL_SPEED * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += JUMP_SPEED
	if Input.is_action_pressed("sprint"):
		SPEED = 800
	else:
		SPEED = 400
	if Input.is_action_pressed("ui_up"):
		velocity -= transform.basis.z * SPEED * delta
	if Input.is_action_pressed("ui_down"):
		velocity += transform.basis.z * SPEED * delta
	if Input.is_action_pressed("ui_left"):
		velocity -= transform.basis.x * SPEED * delta
	if Input.is_action_pressed("ui_right"):
		velocity += transform.basis.x * SPEED * delta
	move_and_slide(velocity, Vector3.UP)
