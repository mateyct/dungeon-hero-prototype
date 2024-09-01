extends CharacterBody3D

var target_location: Vector3
var starting_position: Vector3
var is_mouse_pressed: bool = false

func _physics_process(delta):
	
	if (Input.is_action_just_released("move_here")):
		is_mouse_pressed = false
	
	if(target_location and (position - target_location).length() > .5):
		velocity = (target_location - starting_position).normalized() * delta * 500
		move_and_slide()
	else:
		velocity = Vector3(0, 0, 0)

func _on_ground_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if(event.is_action_pressed("move_here")):
		is_mouse_pressed = true
	if(is_mouse_pressed):
		target_location = event_position
		starting_position = position
	
		
