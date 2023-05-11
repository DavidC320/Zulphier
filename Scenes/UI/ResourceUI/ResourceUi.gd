extends CanvasLayer


func update_label():
	# nodes needed
	if not visible:
		visible = true
	var money_label = $"MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/money"
	var population_label = $"MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/population"
	var wood_label = $"MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/wood"
	var food_label = $"MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/food"
	var minerals_label = $"MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/minerals"
	
	money_label.text = "%s / %s" % [GameData.money, GameData.money_cap]
	population_label.text = "%s / %s" % [GameData.population, GameData.population_cap]
	wood_label.text = "%s / %s" % [GameData.wood, GameData.wood_cap]
	food_label.text = "%s / %s" % [GameData.food, GameData.food_cap]
	minerals_label.text = "%s / %s" % [GameData.minerals, GameData.mineral_cap]


# Called when the node enters the scene tree for the first time.
func _ready():
	GameData.resource_changed.connect(func(): update_label())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_label()


func _on_button_pressed():
	var info_list = $"MarginContainer/VBoxContainer/HBoxContainer"
	info_list.visible = not info_list.visible
