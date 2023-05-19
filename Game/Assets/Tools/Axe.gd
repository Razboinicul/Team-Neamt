extends Area

func _process(delta):
	if Input.is_key_pressed(KEY_1):
		global.tool = 1
		show()
		$CollisionShape.disabled = false
		$CollisionShape2.disabled = false
	if Input.is_key_pressed(KEY_2):
		global.tool = 2
		hide()
		$CollisionShape.disabled = true
		$CollisionShape2.disabled = true
