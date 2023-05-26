extends MarginContainer

var colortext = load("res://Scenes/UI/TileDataUi/ColoredTextLabel/CostTextLabel.tscn")
var change_button = load("res://Scenes/UI/TileDataUi/ChangeButton/ChangeButton.tscn")
var job_ui = load("res://Scenes/UI/job_ui/Job_ui.tscn")

@export var category_name:String = "Category"
@export_enum("tile", "building", "job", "decoration") var category_mode:String
@export var color:Color
@export var child_color:Color
@export var disable_if_no_connection:bool
@export var hide_buttons_if_no_connection = false
@export var seperation_num:int

var selected_item
var selected_mode
var found_connection = false

signal buy_item
signal show_item

# nodes
@onready var textLabel = $VBoxContainer/MarginContainer/VBoxContainer/ItemNameLabel
@onready var show_button = $VBoxContainer/MarginContainer/VBoxContainer/ShowButton
@onready var container_of_items = $VBoxContainer/list

func get_selected():
	return [selected_item, selected_mode]


func update_ui(items, connected=true):
	found_connection = connected
	var job
	var label
	var data
	if items == null:
		items = []

	for child in container_of_items.get_children():
		child.queue_free()

	if not connected and disable_if_no_connection:
		textLabel.text = "No %s" % category_name
		show_button.disabled = true
		return

	for item in items:
		if category_mode == "tile":
			data = TileChanger.tile_dictonary.get(item)
			add_change_button_ui(data, "tile")
		elif category_mode == "building":
			data = TileChanger.building_dictonary.get(item)
			add_change_button_ui(data, "building")
		elif category_mode == "decoration":
			data = TileChanger.decoration_dictonary.get(item)
			add_change_button_ui(data, "decoration")
		elif category_mode == "job":
			if GameData.check_job_show(item.job_show_reqs):
				job = job_ui.instantiate()
				job.update_job_ui(item)
				container_of_items.add_child(job)
	
	if container_of_items.get_child_count() <= 0:
		textLabel.text = "No %s" % category_name
		show_button.disabled = true
	else:
		textLabel.text = category_name
		show_button.disabled = false

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
	button.update_change_button(data, show_check, child_color)
	button.buy_pressed.connect(func(): update_selected_item(data, ui_mode, "buy"))
	button.show_pressed.connect(func(): update_selected_item(data, ui_mode, "show"))
	container_of_items.add_child(button)

func update_selected_item(data, ui_mode, action):
	selected_item = data.get("name").to_lower()
	selected_mode = ui_mode
	if action == "buy":
		emit_signal("buy_item")
	elif action == "show":
		emit_signal("show_item")

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/MarginContainer/ColorRect.color = color
	textLabel.text = category_name
	container_of_items.add_theme_constant_override("separation", seperation_num)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_show_button_pressed():
	container_of_items.visible = not container_of_items.visible
