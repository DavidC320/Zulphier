extends Control


@onready var name_label = $Info/VBoxContainer/HBoxContainer/VBoxContainer/Label
@onready var type_label = $Info/VBoxContainer/HBoxContainer/VBoxContainer/Label2
@onready var description_label = $Info/VBoxContainer/HBoxContainer/RichTextLabel

# info type Item
@onready var itemDataScroll = $Info/VBoxContainer/itemDataScroll


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
