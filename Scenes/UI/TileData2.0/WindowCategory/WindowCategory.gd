@tool  # allows scipts to run in the editor
extends VBoxContainer

# exports
@export var category_name:String
@export var stat_list:Array


# nodes
@onready var nameLabel = $NameLabel
@onready var statContainer = $HBoxContainer/StatContainer
@onready var numContainer = $HBoxContainer/NumContainer

func create_stat_names():
	# empties the container
	for stat_label in statContainer.get_children():
		stat_label.queue_free()

	# adds the new names to the cotnainer
	for stat in stat_list:
		var label = Label.new()  # creates a label
		label.text = stat
		statContainer.add_child(label)


func update_number_contianer(data_list:Array):
	# checks if the lists are the same size
	if data_list.size() != stat_list.size():
		print("data list | %s | is not stat list |%s |" % [data_list.size(), stat_list.size()])
		return

	for number_label in numContainer.get_children():
		number_label.queue_free()
	
	for number_var in data_list:
		var label = Label.new()
		label.text = ": %s" % number_var
		numContainer.add_child(label)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	nameLabel.text = category_name
	create_stat_names()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
