extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_create_map_pressed():
	GameData.map_size = $MarginContainer/VBoxContainer/VBoxContainer5/mapsize.current_number
	GameData.padding = $MarginContainer/VBoxContainer/VBoxContainer5/padding.current_number
	GameData.noise_scale = $MarginContainer/VBoxContainer/VBoxContainer5/noiseScale.current_number
	GameData.tile_altidude = ($MarginContainer/VBoxContainer/VBoxContainer5/TileAltidude.current_number)
	Fade.change_scene("res://Scenes/GameScreen/GameScreen.tscn")


func _on_button_pressed():
	visible = false
