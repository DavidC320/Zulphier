extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	$MarginContainer2.visible = false
	GameData.end_game.connect(func(): show_end_button())


func show_end_button():
	visible = true
	$Animations/AnimationPlayer.play("Glow")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$MarginContainer2.visible = true

func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_back_game_pressed():
	$MarginContainer2.visible = false

func _on_back_title_pressed():
	Fade.change_scene("res://Scenes/Menu/Title/title.tscn")
	
