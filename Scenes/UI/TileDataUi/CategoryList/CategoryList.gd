extends MarginContainer

var colortext = load("res://Scenes/UI/TileDataUi/ColoredTextLabel/CostTextLabel.tscn")
var change_button = load("res://Scenes/UI/TileDataUi/ChangeButton/ChangeButton.tscn")
var job_ui = load("res://Scenes/UI/job_ui/Job_ui.tscn")

var tile_builder = load("res://Scenes/TileData/TileCreator.gd").new()

@export var category_name:String = "Category"
@export_enum("Tile", "building", "job", "reward", "cost") var category_mode:String
@export var color:Color
@export var disable_if_no_connection:bool

func update_ui(items, connected=true):
	var job
	var label
	var data
	if items == null:
		items = []

	if not connected and disable_if_no_connection:
		return
	for item in items:
		if category_mode == "Tile":
			data = tile_builder.dictonary_of_tiles.get(item)
			add_tile_building_ui(data)
		elif category_mode == "building":
			data = tile_builder.building_dict.get(item)
			add_tile_building_ui(data)
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
		print("compelted")

func add_tile_building_ui(data):
	var button = change_button.instantiate()
	button.set_up_change_button(data)
	$VBoxContainer/list.add_child(button)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$ColorRect.color = color
	$VBoxContainer/MarginContainer/VBoxContainer/ItemNameLabel.text = category_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_show_button_pressed():
	pass # Replace with function body.
