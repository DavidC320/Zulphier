extends Node
var map_size = 11
var tile_size = 1
var padding = 0.0
var noise_scale = 4



func hide_town_center_text():
	$"scene stuff/ui/CanvasLayer/MarginContainer/Typing_text".reverse_animation()


func _ready():
	var clamps = $Map.create_map(map_size, tile_size, padding, noise_scale, 2)
	$"scene stuff/Camerea controler"._change_pos_clamp(clamps[0], clamps[1])
	GameData.game_map = $Map.grid
	GameData.resource_changed.connect(func(): show_resources())
	GameData.center_created.connect(func(): hide_town_center_text())
	$"scene stuff/ui/CanvasLayer/MarginContainer/Typing_text".play_animation()
	$"scene stuff/ui/MoneyUi".visible = false
	$"scene stuff/ui/TileDataUi".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _unhandled_input(event):
	if event.is_action_pressed("mouse select"):
		_mouse_click()
