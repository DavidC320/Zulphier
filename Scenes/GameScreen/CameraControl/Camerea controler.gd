extends CharacterBody3D
var x_min = -1
var x_max = 1
var z_min = -1
var z_max = 1

@export var SPEED = 5.0


func _change_pos_clamp(x, z):
	x_min = x
	x_max = -1 * x
	z_min = z
	z_max = -1 * z


func _movement(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	position.x = clamp(position.x, x_min, x_max)
	position.z = clamp(position.z, z_min, z_max)


func _physics_process(delta):
	_movement(delta)
