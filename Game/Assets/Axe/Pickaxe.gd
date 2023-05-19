extends Area

func _process(delta):
	if Input.is_key_pressed(KEY_1):
		global.tool = 1
		hide()
		$CollisionShape.disabled = true
		$CollisionShape2.disabled = true
	if Input.is_key_pressed(KEY_2):
		global.tool = 2
		show()
		$CollisionShape.disabled = false
		$CollisionShape2.disabled = false
	
 
func mine():
	rotation.x = 25
	global.pickaxe_attack = true

func dont_mine():
	rotation.x = 0
	global.pickaxe_attack = false
