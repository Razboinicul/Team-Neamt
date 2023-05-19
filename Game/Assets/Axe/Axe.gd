extends Area

func _process(delta):
	if Input.is_key_pressed(KEY_1):
		global.tool = 1
		show()
		$CollisionShape.disabled = false
	if Input.is_key_pressed(KEY_2):
		global.tool = 2
		hide()
		$CollisionShape.disabled = true
	if Input.is_action_just_pressed("attack"):
		if global.tool == 1:
			rotation.x = 25
			for i in range(0, 35):
				rotation.z = i
			global.axe_attack = true
	else: 
		rotation.x = 0
		rotation.z = 0
		global.axe_attack = false
