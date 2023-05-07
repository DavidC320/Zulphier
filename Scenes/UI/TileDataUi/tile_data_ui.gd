extends CanvasLayer

var current_tile = null


func update_ui(selected_tile):
	# Nodes needed
	var tileNameLabel:Label = $MarginContainer/HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/TileNameLabel
	var buildingNameLabel:Label = $MarginContainer/HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/BuildingNameLabel
	var tileVisulizer = $MarginContainer/HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/SubViewportContainer
	
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

	# Tiles
	print("Tiles %s" % [tiles])
	$MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Tiles.update_ui(tiles)

	# Buildings
	print("buildings %s" % [buildings])
	$MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Buildings.update_ui(buildings)

	# Jobs
	print("jobs %s" % [jobs])
	$MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Jobs.update_ui(jobs)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
