@tool
extends MarginContainer

@export var info_name:String
@export_enum("requirment", "cost", "bonuses", "general") var info_type:String
@export var hide_if_empty = true


@onready var infoListContainer = $VBoxContainer/ScrollContainer/InfoList
@onready var namelabel = $VBoxContainer/MarginContainer/Label

var colortext = preload("res://Scenes/UI/TileDataUi/ColoredTextLabel/CostTextLabel.tscn")

func add_data_to_list(data_list:Array):
	for child in infoListContainer.get_children():
		child.queue_free()

	for data in data_list:
		var label
		if info_type == "requirment":
			label = Label
			label.text = String(data)

		elif info_type == "cost":
			label = colortext.instantiate()
			label.set_data(data)

		elif info_type == "bonuses":
			label = colortext.instantiate()
			label.set_data(data, true)

		elif info_type == "general":
			label = Label
			label.text = String(data)

		if label:
			infoListContainer.add_child(label)
	
	if infoListContainer.get_child_count() == 0 and hide_if_empty:
		visible = false
	else:
		visible = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	namelabel.text = info_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
