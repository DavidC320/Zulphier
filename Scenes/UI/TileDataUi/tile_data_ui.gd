extends CanvasLayer

var current_tile = null


func update_ui(selected_tile):
	# Nodes needed
	var tileNameLabel:Label = $MarginContainer/HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/TileNameLabel
	var buildingNameLabel:Label = $MarginContainer/HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/BuildingNameLabel
	var tileVisulizer = $MarginContainer/HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/SubViewportContainer

	# contiatners
	var tile_contianer = $MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Tiles
	var building_contianer = $MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Buildings
	var job_contianer = $MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Jobs
	
	current_tile = selected_tile
	var tile_data = selected_tile.duplicate_tile_output()
	tileVisulizer.change_tile(tile_data)

	tileNameLabel.text = current_tile.tile_name
	if current_tile.building_name.length() > 0:
		buildingNameLabel.visible = true
		buildingNameLabel.text = current_tile.building_name
	else:
		buildingNameLabel.visible = false

	var data = current_tile.get_available_items()
	var tiles = data[1]
	var buildings = data[0]
	var jobs = data[2]

	# adding items to the categories
	var connection = GameData.check_for_connections()

	# Tiles
	tile_contianer.update_ui(tiles, connection)
	tile_contianer.buy_item.connect(func(): buy_item(tile_contianer))
	tile_contianer.show_item.connect(func(): show_item(tile_contianer))

	# Buildings
	building_contianer.update_ui(buildings, connection)
	building_contianer.buy_item.connect(func(): buy_item(building_contianer))
	building_contianer.show_item.connect(func(): show_item(building_contianer))


	# Jobs
	job_contianer.update_ui(jobs, connection)


func buy_item(container_node):
	var tileVisulizer = $MarginContainer/HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/SubViewportContainer

	var selected_data = container_node.get_selected()
	var item = selected_data[0]
	var mode = selected_data[1]
	if mode == "tile":
		$sfx/build_tile.play()
		tileVisulizer.change_show_tile(item)
		current_tile.change_tile(item)
	else:
		$sfx/build_building.play()
		tileVisulizer.change_show_building(item)
		current_tile.change_building(item)
	update_ui(current_tile)


func show_item(container_node):
	var tileVisulizer = $MarginContainer/HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/SubViewportContainer

	var selected_data = container_node.get_selected()
	var item = selected_data[0]
	var mode = selected_data[1]
	
	if mode == "tile":
		tileVisulizer.change_show_tile(item)
	else:
		tileVisulizer.change_show_building(item)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
