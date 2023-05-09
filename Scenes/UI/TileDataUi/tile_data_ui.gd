extends CanvasLayer

var current_tile = null

# nodes
@onready var tileNameLabel:Label = $MarginContainer/HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/TileNameLabel
@onready var buildingNameLabel:Label = $MarginContainer/HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/BuildingNameLabel
@onready var tileVisulizer = $MarginContainer/HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/SubViewportContainer

# contiatners
@onready var tile_contianer = $MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Tiles
@onready var building_contianer = $MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Buildings
@onready var job_contianer = $MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Jobs

# sounds
@onready var build_sfx =  $sfx/build_building
@onready var tile_sfx =  $sfx/build_tile


func update_ui(selected_tile):
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
	var connection = GameData.check_for_connections()
	# Tiles
	tile_contianer.update_ui(tiles, connection)
	# Buildings
	building_contianer.update_ui(buildings, connection)
	# Jobs
	job_contianer.update_ui(jobs, connection)


func buy_item(container_node):
	var selected_data = container_node.get_selected()
	var item = selected_data[0]
	var mode = selected_data[1]
	if mode == "tile":
		tile_sfx.play()
		tileVisulizer.change_show_tile(item)
		current_tile.change_tile(item)
	else:
		build_sfx.play()
		tileVisulizer.change_show_building(item)
		current_tile.change_building(item)
	update_ui(current_tile)


func show_item(container_node):
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
	
	# Tiles
	tile_contianer.buy_item.connect(func(): buy_item(tile_contianer))
	tile_contianer.show_item.connect(func(): show_item(tile_contianer))

	# Buildings
	building_contianer.buy_item.connect(func(): buy_item(building_contianer))
	building_contianer.show_item.connect(func(): show_item(building_contianer))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
