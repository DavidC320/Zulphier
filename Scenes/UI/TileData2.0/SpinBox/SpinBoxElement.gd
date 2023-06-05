@tool
extends MarginContainer

@export var min_num:int = 0
@export var max_num:int = 99
@export var num_step = 1
@export var defalut_num:int = 0
var current_num:int = 0

@onready var numLabel = $HBoxContainer/Label


func update_text():
	numLabel.text = "%s / %s" % [current_num, max_num]

func set_info(min_n, max_n, step, defalut):
	min_num = min_n
	max_num = max_n
	num_step = step
	defalut_num = defalut
	current_num = defalut_num
	update_text()
	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	update_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_default_pressed():
	pass # Replace with function body.
	current_num = defalut_num
	update_text()


func _on_more_pressed():
	pass # Replace with function body.
	current_num += num_step
	if current_num > max_num:
		current_num = max_num
	update_text()

func _on_less_pressed():
	pass # Replace with function body.
	current_num -= num_step
	if current_num < min_num:
		current_num = min_num
	update_text()
