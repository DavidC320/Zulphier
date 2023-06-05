extends Control

var current_mode = "tile"

var tile_list:Array
var building_list:Array
var decoration_list:Array
var job_list:Array

@onready var dataContainter = $VBoxContainer/VBoxContainer/MarginContainer2/HBoxContainer/Datacont

var item_element = preload("res://Scenes/UI/TileData2.0/UIElement/item_ui_element.tscn")

func change_mode(mode_name:String):
	pass
	current_mode = mode_name
	update_data_list()


func update_data_list():
	var data_dict = {
		"tile" : tile_list,
		"building" : building_list,
		"decoration" : decoration_list,
		#"job" : job_list
	}
	var color_dict = {
		"tile" : "#2c67ff",
		"building" : "#c25000",
		"decoration" : "#c200c5",
		#"job" : "#578900"

	}
	
	for child in dataContainter.get_children():
		child.queue_free()

	for item in data_dict.get(current_mode):
		var item_ui = item_element.instantiate()
		item_ui.set_up_button(item, current_mode, color_dict.get(current_mode))
		dataContainter.add_child(item_ui)




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Replace with function body.
	pass


func _on_tile_button_pressed():
	pass


func _on_building_button_pressed():
	pass # Replace with function body.


func _on_decoration_button_pressed():
	pass # Replace with function body.


func _on_job_button_pressed():
	pass # Replace with function body.
