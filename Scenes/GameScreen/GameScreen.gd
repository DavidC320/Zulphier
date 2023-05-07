extends Node3D
var map_size = 11
var tile_size = 1
var padding = 0.0
var noise_scale = 4

const RAY_LENGTH = 1000.0


func _mouse_click(event):
	var tileDataUI = $Control/TileDataUI

	var space_state = get_world_3d().direct_space_state
	var camera = $"Scene/StaticBody3D/cameraPivot/Camera3D"
	var from = camera.project_ray_origin(event.position)
	var to = from + camera.project_ray_normal(event.position) * RAY_LENGTH
	var queary = PhysicsRayQueryParameters3D.create(from, to)
	var intersection = space_state.intersect_ray(queary)
	if intersection.size() > 0:
		print(intersection.get("collider"))
		tileDataUI.update_ui(intersection.get("collider"))



func hide_town_center_text():
	$"scene stuff/ui/CanvasLayer/MarginContainer/Typing_text".reverse_animation()


func _ready():
	var clamps = $Map.create_map(map_size, tile_size, padding, noise_scale, 2)
	$"Scene/StaticBody3D"._change_pos_clamp(clamps[0], clamps[1])
	GameData.map_data = $Map.grid
	#GameData.resource_changed.connect(func(): show_resources())
	#GameData.center_created.connect(func(): hide_town_center_text())
	#$"scene stuff/ui/CanvasLayer/MarginContainer/Typing_text".play_animation()
	#$"scene stuff/ui/MoneyUi".visible = false
	#$"scene stuff/ui/TileDataUi".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _unhandled_input(event):
	if event.is_action_pressed("mouse select"):
		_mouse_click(event)
