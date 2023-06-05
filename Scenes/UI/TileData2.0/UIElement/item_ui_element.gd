extends MarginContainer

var item_name:String
var item_data:Dictionary
var item_type:String
var show_requirments:Array
var requirments:Array
var cost:Array

var mouse_in_ui = false

var show_hidden = false

# Color rect
@onready var select_color_rect = $VBoxContainer/DataCont/selectColor
@onready var requirment_color = $VBoxContainer/DataCont/requirmentColor
@onready var item_color = $ColorRect

# req colors
@onready var show_cont = $VBoxContainer/DataCont/VBoxContainer/showCont
@onready var requirments_cont = $VBoxContainer/DataCont/VBoxContainer/ReqCont
@onready var cost_cont = $VBoxContainer/DataCont/VBoxContainer/CostCont

# buy button
@onready var buy_button = $VBoxContainer/Buy

#signals
signal Show_Info_window
signal buy_item

# colors
var color_req_dict = {
	true : "#629c0085",  # met req,
	false : "#ff000085"  # missing
}

var missing_color = "#ff000085"
var met_color = "#629c0085"


func set_up_button(i_name:String, type:String, color, show_failed_show:bool=false):
	# getting data
	var data
	if type == "tile":
		data = TileChanger.tile_dictonary.get(i_name)
	elif type == "building":
		data = TileChanger.building_dictonary.get(i_name) 
	elif type == "decoration":
		data = TileChanger.decoration_dictonary.get(i_name)
	
	if data == null:
		print("item given| %s | is not in | %s |")
		visible = false
		return
	
	item_color.color = color
	item_data = item_data
	item_name = item_data.get("name")
	item_type = type
	show_requirments = item_data.get("show")  # needs to be updated
	requirments = item_data.get("show")
	cost = item_data.get("cost")
	show_hidden = show_failed_show


	# show requirments
	if not show_hidden:
		show_cont.visible = false
	update_requirments()
	GameData.resource_changed.connect(func(): update_requirments())


func update_requirments():
	var show_met = GameData.check_item_requirments(item_data, show_requirments)
	show_cont.get_child(0).color = color_req_dict.get(show_met)

	if not show_met and not show_hidden:
		visible = false

	# requirments
	var requirment_met = GameData.check_item_requirments(item_data, requirments)
	requirments_cont.get_child(0).color = color_req_dict.get(requirment_met)

	# cost
	var cost_met = GameData.check_list_of_cost(cost)
	cost_cont.get_child(0).color = color_req_dict.get(cost_met)

	var all_met = show_met and requirment_met and cost_met
	requirment_color.color = color_req_dict.get(all_met)
	buy_button.disabled = not all_met


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _input(event):
	if event.is_action_released("mouse select") and mouse_in_ui:
		print("get info")


func _on_mouseinput_feild_mouse_entered():
	select_color_rect.visible = true
	mouse_in_ui = true


func _on_mouseinput_feild_mouse_exited():
	select_color_rect.visible = false
	mouse_in_ui = false
