extends MarginContainer

var current_tile = null

# nodes
@onready var tileNameLabel:Label = $HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/TileNameLabel
@onready var buildingNameLabel:Label = $HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/BuildingNameLabel
@onready var tileVisulizer = $HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/SubViewportContainer
@onready var level_label = $HBoxContainer/VBoxContainer/TileVisuliser/VBoxContainer/BuildingLevelLabel

# contiatners
@onready var tile_contianer = $HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Tiles
@onready var building_contianer = $HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Buildings
@onready var job_contianer = $HBoxContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/Jobs

# sounds
@onready var build_sfx =  $sfx/build_building
@onready var tile_sfx =  $sfx/build_tile


func update_ui(selected_tile):
	if not visible:
		visible = true
		
	"if current_tile != null:
		current_tile.exp_change.disconnect(func(): update_level_label())
		current_tile.level_up.disconnect(func(): update_ui(current_tile))"

	current_tile = selected_tile
	var tile_data = selected_tile.duplicate_tile_output()
	tileVisulizer.change_tile(tile_data)
	
	current_tile.exp_change.connect(func(): update_level_label())
	current_tile.level_up.connect(func(): update_ui(current_tile))

	tileNameLabel.text = current_tile.tile_name
	if current_tile.building_name.length() > 0:
		buildingNameLabel.visible = true
		buildingNameLabel.text = "Lv: %s | %s" % [current_tile.building_level, current_tile.building_name]
		level_label.visible = true
		update_level_label()
	else:
		buildingNameLabel.visible = false
		level_label.visible = false

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



func update_level_label():
	if current_tile.maxed_level:
			level_label.text = "Maxed"
	else:
		level_label.text = "%s / %s" % [current_tile.building_exp, current_tile.building_level_up]


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

	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	$HBoxContainer/VBoxContainer.visible = not $HBoxContainer/VBoxContainer.visible
