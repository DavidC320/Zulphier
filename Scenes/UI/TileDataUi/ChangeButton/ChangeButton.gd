extends MarginContainer

var rewards = []
var costs = []

func set_up_change_button(item_data):
	rewards = item_data.get("building effects")
	costs = item_data.get("cost")

	# rewards
	$VBoxContainer/ScrollContainer/VBoxContainer/CategoryList.update_ui(rewards)

	# cost
	$VBoxContainer/ScrollContainer/VBoxContainer/CategoryList2.update_ui(costs)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
