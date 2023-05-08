extends MarginContainer

@export var resource:String = "population"
@export var number:int = 1
@export var ignore_check:bool = false


func set_data(data, ignore_resoruce_check= false):
	var label = $"Label"
	resource = data[0]
	number = data[1]
	ignore_check = ignore_resoruce_check
	label.text = "%s | %s" % [number, resource]

func update_cost_color():
	var colorRect = $"ColorRect"

	# colors
	var missing_color = "#ff0003a3"
	var full_color = "#669b00a3"

	if not ignore_check:
		var enough_resources = GameData.check_resources(resource, number)
		if enough_resources:
			colorRect.color = full_color
		else:
			colorRect.color = missing_color
	else:
		colorRect.color = "#515151a3"


# Called when the node enters the scene tree for the first time.
func _ready():
	update_cost_color()
	if not ignore_check:
		GameData.resource_changed.connect(func(): update_cost_color())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

