extends MarginContainer

var colored_resource_text = preload("res://Scenes/UI/TileDataUi/ColoredTextLabel/CostTextLabel.tscn")

var rewards = []
var costs = []

signal buy_pressed
signal show_pressed


func add_data_to_list_containers(container_node, data_list, ignore_check):
	for data in data_list:
		var text = colored_resource_text.instantiate()
		text.set_data(data, ignore_check)
		container_node.add_child(text)


func update_change_button(item_data, connected, color):
	rewards = item_data.get("building effects")
	costs = item_data.get("cost")
	$ColorRect.color = color
	$VBoxContainer/TopSection/Label.text = item_data.get("name")
	$VBoxContainer/VBoxContainer/RichTextLabel.text = str(item_data.get("desc"))

	# rewards
	if rewards:
		var bonus_List = $VBoxContainer/Info/Creation_bonus/BonusList
		add_data_to_list_containers(bonus_List, rewards, true)

	# cost
	if costs:
		var cost_list = $VBoxContainer/Info/Cost/CostList
		add_data_to_list_containers(cost_list, costs, false)
	
	if not connected:
		$VBoxContainer/buyButton.visible = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_buy_button_pressed():
	if GameData.check_list_of_cost(costs):
		GameData.cost_interp(costs, -1)
		emit_signal("buy_pressed")


func _on_show_button_pressed():
	emit_signal("show_pressed")
