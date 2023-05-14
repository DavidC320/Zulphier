extends Node3D
var tile_size = 1

const RAY_LENGTH = 1000.0


# tutorial stuff
var uncreated_center = true


func _mouse_click(event):
	var tileDataUI = $Control/TileDataUI

	var space_state = get_world_3d().direct_space_state
	var camera = $"Scene/StaticBody3D/cameraPivot/Camera3D"
	var from = camera.project_ray_origin(event.position)
	var to = from + camera.project_ray_normal(event.position) * RAY_LENGTH
	var queary = PhysicsRayQueryParameters3D.create(from, to)
	var intersection = space_state.intersect_ray(queary)
	if intersection.size() > 0:
		GameData.selected_tile = intersection.get("collider")
		tileDataUI.update_ui(intersection.get("collider"))


func tutorial():
	if uncreated_center:
		if GameData.center > 0:
			$Animation/Start_game.play("Start_Game")
			uncreated_center = false
			$Scene/AudioStreamPlayer.play()
			$Timers/day_timer.start()


func hide_town_center_text():
	$"scene stuff/ui/CanvasLayer/MarginContainer/Typing_text".reverse_animation()


func _ready():
	GameData.reset_game()
	var clamps = $Map.create_map(GameData.map_size, tile_size, GameData.padding, GameData.noise_scale, GameData.tile_altidude)
	$"Scene/StaticBody3D"._change_pos_clamp(clamps[0], clamps[1])
	GameData.resource_changed.connect(func(): tutorial())
	$Control/MoneyUi.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _unhandled_input(event):
	if event.is_action_pressed("mouse select"):
		_mouse_click(event)
	if event.is_action_pressed("Pause_game"):
		$"Control/PauseMenu".visible = true


func _on_day_timer_timeout():
	$Animation/day_night.play("Day_night")
	$Timers/day_timer.stop()
	$Timers/night_timer.start()

func _on_night_timer_timeout():
	$Animation/day_night.play_backwards("Day_night")
	$Timers/night_timer.stop()
	$Timers/day_timer.start()
