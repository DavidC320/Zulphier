extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Map.create_map(21, 1, 0, 3, 2)
	$"animation/map spin animation".play("Spin map")
	$"animation/intro".play("Intro_sequence")
	$Menu/GenerationMenu.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_title_menu_play_game():
	pass # Replace with function body.
	$Menu/GenerationMenu.visible = true
