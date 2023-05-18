extends KinematicBody

var LOOK_SPEED = 0.8
var SPEED = 400
var FALL_SPEED = 300
var JUMP_SPEED = 400
var mouse_sens = 0.3
var camera_anglev=0

func _input(event):         
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x*mouse_sens))
		var changev=-event.relative.y*mouse_sens
		if camera_anglev+changev>-50 and camera_anglev+changev<50:
			camera_anglev+=changev
			$Camera.rotate_x(deg2rad(changev))

func _physics_process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print(is_on_floor())
	var velocity = Vector3.ZERO
	if not is_on_floor(): velocity.y -= FALL_SPEED * delta
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y += JUMP_SPEED
	if Input.is_action_pressed("ui_up"):
		velocity -= transform.basis.z * SPEED * delta
	if Input.is_action_pressed("ui_down"):
		velocity += transform.basis.z * SPEED * delta
	if Input.is_action_pressed("ui_left"):
		velocity -= transform.basis.x * SPEED * delta
	if Input.is_action_pressed("ui_right"):
		velocity += transform.basis.x * SPEED * delta
	move_and_slide(velocity, Vector3.UP)
