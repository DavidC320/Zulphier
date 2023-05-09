extends CharacterBody3D
var x_min = -1
var x_max = 1
var z_min = -1
var z_max = 1

@export var SPEED = 5.0

var zoom_dir = 0
@onready var camera = $cameraPivot/Camera3D

@export var min_zoom = 5
@export var max_zoom = 14
@export var zoom_speed = 20
@export var zoom_speed_damp = .5


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
	_zoom(delta)
	
func _zoom(delta):
	# calculate new zoom
	var new_zoom = clamp(camera.position.y + zoom_speed * delta * zoom_dir, 
	min_zoom,
	max_zoom)
	#clamp bwteen min and max
	camera.position.y = new_zoom
	#stop zoom
	zoom_dir = 0
	pass

func _unhandled_input(event):
	if event.is_action_pressed("zoom_in"):
		zoom_dir = -1
		print("in")
	elif event.is_action_pressed("zoom_out"):
		zoom_dir = 1
		print("out")
