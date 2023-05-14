extends Node3D

var skip_disabled = false
var skip_num = 0


func tap_skip():
	skip_num +=1
	if skip_num == 2:
		start_outro()
	elif skip_num == 1:
		$CanvasLayer/TypingText.play_animation()


func disable_skip():
	skip_disabled = true


func fade_to_screen():
	Fade.change_scene("res://Scenes/Menu/Title/title.tscn")


func start_outro():
	$CanvasLayer.visible = false
	$sfx/AudioStreamPlayer.stop()
	$animations/AnimationPlayer.stop()
	skip_disabled = true
	$animations/AnimationPlayer2.play("Outro")

func _input(event):
	if event.is_action_pressed("mouse select") and not skip_disabled:
		tap_skip()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$animations/AnimationPlayer.play("start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
