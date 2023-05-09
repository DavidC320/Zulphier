extends MarginContainer

@export var speed_scale = 1.0
@export_multiline var label_text = ""
var done = false


func play_animation():
	$Label.text = label_text
	$AnimationPlayer.speed_scale = speed_scale
	$AnimationPlayer.play("DisplayText")


func reverse_animation():
	$AnimationPlayer.speed_scale = speed_scale
	$AnimationPlayer.play_backwards("DisplayText")


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("RESET")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
