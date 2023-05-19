extends KinematicBody

var LOOK_SPEED = 0.8
var SPEED = 400
var FALL_SPEED = 400
var JUMP_SPEED = 400
var mouse_sens = 0.3
var camera_anglev=0
var rot = 0
var tool = 1
func _input(event): 
	if event.is_action_pressed("attack"):
		if tool == 1:
			$Camera/Axe.rotation.x = 25
			for i in range(0, 35):
				$Camera/Axe.rotation.z = i
			global.axe_attack = true
		else: 
			$Camera/Axe.rotation.x = 0
			$Camera/Axe.rotation.z = 0
			global.axe_attack = false
		if tool == 2:
			for i in range(0, 55):
				$Camera/Axe.rotation.x = i
			global.pickaxe_attack = true
		else: 
			$Camera/Axe.rotation.z = 0
			global.pickaxe_attack = false
	if Input.is_key_pressed(KEY_1):
		tool = 1
		$Camera/Axe.show()
		$Camera/Axe/CollisionShape.disabled = false
		$Camera/Pickaxe.hide()
		$Camera/Pickaxe/CollisionShape.disabled = true
		$Camera/Pickaxe/CollisionShape1.disabled = true
	if Input.is_key_pressed(KEY_2):
		tool = 2
		$Camera/Axe.hide()
		$Camera/Axe/CollisionShape.disabled = true
		$Camera/Pickaxe.show()
		$Camera/Pickaxe/CollisionShape.disabled = false
		$Camera/Pickaxe/CollisionShape2.disabled = false
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x*mouse_sens))
		var changev=-event.relative.y*mouse_sens
		if camera_anglev+changev>-50 and camera_anglev+changev<50:
			camera_anglev+=changev
			$Camera.rotate_x(deg2rad(changev))

func _physics_process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	var velocity = Vector3.ZERO
	if Input.is_action_pressed("ui_end"):
		get_tree().change_scene("res://Main Menu/Main Menu.tscn")
	if not is_on_floor(): velocity.y -= FALL_SPEED * delta 
	if is_on_floor() and Input.is_action_just_pressed("jump"):
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
