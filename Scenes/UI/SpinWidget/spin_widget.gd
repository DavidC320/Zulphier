extends MarginContainer

@export var widget_name:String
@export var min_num:float
@export var current_number:float
@export var max_num:float
@export var jump_num:float


func update_num_label():
	$VBoxContainer/MarginContainer/Label2.text = "%s / %s" % [current_number, max_num]



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	update_num_label()
	$VBoxContainer/Label.text = widget_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_more_pressed():
	pass # Replace with function body.
	current_number += jump_num
	if current_number > max_num:
		current_number = max_num
	update_num_label()

func _on_less_pressed():
	pass # Replace with function body.
	current_number -= jump_num
	if current_number < min_num:
		current_number = min_num
	update_num_label()
