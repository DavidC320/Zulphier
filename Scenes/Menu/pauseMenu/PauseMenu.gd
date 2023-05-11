extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event.is_action_pressed("Pause_game"):
		visible = false


func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_back_game_pressed():
	visible = false

func _on_back_title_pressed():
	Fade.change_scene("res://Scenes/Menu/Title/title.tscn")
