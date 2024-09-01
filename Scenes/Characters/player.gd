extends CharacterBody3D

func _physics_process(delta):
	var direction = Vector3.ZERO
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	
	if(direction != Vector3.ZERO):
		var toLook : Basis = Basis.looking_at(direction.normalized())
		basis = lerp(basis, toLook, .25)

	
	velocity = direction.normalized()  * 14
	
	
	move_and_slide()
