extends MarginContainer

var rewards = []
var costs = []

signal buy_pressed
signal show_pressed

func set_up_change_button(item_data, connected):
	rewards = item_data.get("building effects")
	costs = item_data.get("cost")

	$VBoxContainer/TopSection/Label.text = item_data.get("name")
	$VBoxContainer/VBoxContainer/RichTextLabel.text = str(item_data.get("desc"))

	# rewards
	$VBoxContainer/VBoxContainer2/CategoryList.update_ui(rewards)

	# cost
	$VBoxContainer/VBoxContainer2/CategoryList2.update_ui(costs)

	# connection
	if not connected:
		$VBoxContainer/TopSection/MarginContainer.visible = true
		$VBoxContainer/VBoxContainer2/CategoryList.visible = false
		$VBoxContainer/VBoxContainer2/CategoryList2.visible = false
		$VBoxContainer/buyButton.visible = false
	else:
		$VBoxContainer/TopSection/MarginContainer.visible = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_buy_button_pressed():
	if GameData.check_list_of_cost(costs):
		GameData.cost_interp(costs)
		emit_signal("buy_pressed")


func _on_show_button_pressed():
	emit_signal("show_pressed")
