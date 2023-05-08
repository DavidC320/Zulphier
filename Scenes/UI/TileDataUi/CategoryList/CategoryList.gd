extends MarginContainer

var colortext = load("res://Scenes/UI/TileDataUi/ColoredTextLabel/CostTextLabel.tscn")
var change_button = load("res://Scenes/UI/TileDataUi/ChangeButton/ChangeButton.tscn")
var job_ui = load("res://Scenes/UI/job_ui/Job_ui.tscn")

var tile_builder = load("res://Scenes/TileData/TileCreator.gd").new()

@export var category_name:String = "Category"
@export_enum("tile", "building", "job", "reward", "cost") var category_mode:String
@export var color:Color
@export var disable_if_no_connection:bool
@export var hide_buttons_if_no_connection = false
@export var seperation_num:int

var selected_item
var selected_mode
var found_connection = false

signal buy_item
signal show_item


func get_selected():
	return [selected_item, selected_mode]


func update_ui(items, connected=true):
	found_connection = connected
	var job
	var label
	var data
	if items == null:
		items = []

	for child in $VBoxContainer/list.get_children():
		child.queue_free()

	if not connected and disable_if_no_connection:
		return

	for item in items:
		if category_mode == "tile":
			data = tile_builder.dictonary_of_tiles.get(item)
			add_change_button_ui(data, "tile")
		elif category_mode == "building":
			data = tile_builder.building_dict.get(item)
			add_change_button_ui(data, "building")
		elif category_mode == "job":
			job = job_ui.instantiate()
			job.update_job_ui(item)
			$VBoxContainer/list.add_child(job)
		elif category_mode == "reward":
			label = colortext.instantiate()
			label.set_data(item, true)
			$VBoxContainer/list.add_child(label)
		elif category_mode == "cost":
			label = colortext.instantiate()
			label.set_data(item)
			$VBoxContainer/list.add_child(label)
	
	if $VBoxContainer/list.get_child_count() > 0:
		visible = true
	else:
		visible = false

func change_item(item_data:Dictionary, item_type:String, change_type:String):
	selected_item = item_data
	if item_type == "tile":
		if change_type == "buy":
			emit_signal("buy_tile")
		else:
			emit_signal("show_tile")
	else:
		if change_type == "buy":
			emit_signal("buy_building")
		else:
			emit_signal("show_building")


func add_change_button_ui(data, ui_mode):
	var show_check = GameData.check_show(data, found_connection)
	if not show_check and hide_buttons_if_no_connection:
		return

	var button = change_button.instantiate()
	button.set_up_change_button(data, show_check)
	button.buy_pressed.connect(func(): update_selected_item(data, ui_mode, "buy"))
	button.show_pressed.connect(func(): update_selected_item(data, ui_mode, "show"))
	$VBoxContainer/list.add_child(button)

func update_selected_item(data, ui_mode, action):
	selected_item = data.get("name").to_lower()
	selected_mode = ui_mode
	if action == "buy":
		emit_signal("buy_item")
	elif action == "show":
		emit_signal("show_item")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$VBoxContainer/MarginContainer/ColorRect.color = color
	$VBoxContainer/MarginContainer/VBoxContainer/ItemNameLabel.text = category_name
	$VBoxContainer/list.add_theme_constant_override("separation", seperation_num)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_show_button_pressed():
	$VBoxContainer/list.visible = not $VBoxContainer/list.visible
