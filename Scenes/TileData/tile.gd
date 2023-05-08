extends StaticBody3D

var tile_builder = load("res://Scenes/TileData/TileCreator.gd").new()

var column:int
var row:int

# tile data
var state = "idle"
var perlin_value = 0
var tile_name = ""
var tile_material = null
var tile_buildings = []  # what can be built on this tile
var tile_tiles = []  # what this tile can be changed to


# building data
var building = null
var building_name = ""
var building_settings = {}
var job_list = []
var building_buildings = []  # what can be built on this tile
var building_tiles = []  # what this tile can be changed to

@export var display_tile = false


func get_available_items():
	var building_pos = $"TileMesh/BuildingPos"
	if building_pos.get_child_count() > 0:
		return [building_buildings, building_tiles, job_list]
	else:
		return [tile_buildings, tile_tiles, []]


func add_job(job_node):
	if not display_tile:
		$Jobs.add_child(job_node)
		job_list.append(job_node)

func clear_jobs():
	if not display_tile:
		job_list.clear()
		for job in $Jobs.get_children():
			GameData.change_resource("population", job.number_of_workers)
			$Jobs.remove_child(job)


###############################################################################
############################## Changing the tile ##############################
###############################################################################



func change_tile(tile_c_name, print_children = false):
	# Setting tile data
	tile_name = tile_c_name
	
	tile_builder.change_tile(self, tile_c_name)
	update_tile()
	
	if print_children:
		print(self.get_node("TileMesh/BuildingPos").get_child_count())
		

func change_building(building_data_name):
	building = building_data_name
	tile_builder.create_building(self, building_data_name)
	change_building_layer()

func update_tile():
	$TileMesh.material_override = load(tile_material)

###############################################################################
############################## Changing the tile ##############################
###############################################################################

################################
# Duplicating tile data to ui  #
################################


func duplicate_tile_output():
	var data = {
		"name" : tile_name,
		"material" : $TileMesh.material_override, 
		"building name" : building
		}
	return data


func duplicate_tile_input(data):
	tile_name = data.get("name")
	$TileMesh.material_override = data.get("material")
	tile_builder.create_building(self, data.get("building name"))
	building = data.get("building name")
	change_building_layer()

################################
# Duplicating tile data to ui  #
################################

func change_building_layer():
	var building_pos = $"TileMesh/BuildingPos"
	if building_pos.get_children() and display_tile:
			var building_model = building_pos.get_child(0).get_child(0)
			building_model.layers = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	if display_tile:
		$TileMesh.layers = 2
		change_building_layer()
	


func _process(_delta):
	pass


func _on_mouse_entered():
	$"Animations/TileHover".play("TileHover")


func _on_mouse_exited():
	$"Animations/TileHover".play_backwards("TileHover")
