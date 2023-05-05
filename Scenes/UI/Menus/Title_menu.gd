extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/ColorRect.color = "#ffffff00"
	$MarginContainer.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event.is_action_pressed("mouse select"):
		$MarginContainer/ColorRect.color = "#121212b3"
		$MarginContainer.visible = true


func _on_exit_pressed():
	get_tree().quit()


func _on_play_pressed():
	Fade.change_scene("res://Templates/scenes/main game scene/game_screen.tscn")
