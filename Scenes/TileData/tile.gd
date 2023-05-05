extends Area3D

@onready var tile_builder = load("res://Templates/Tiles/TileCreator.gd").new()

var x:int
var y:int

# tile data
var state = "idle"
var perlin_value = 0
var tile_name = ""
var tile_category = ""
var altidude_offset = 0
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
	var building_pos = $"BuildingPos"
	if building_pos.get_child_count() > 0:
		return [building_buildings, building_tiles]
	else:
		return [tile_buildings, tile_tiles]


func add_job(job_node):
	$jobs.add_child(job_node)
	job_list.append(job_node)

func clear_jobs():
	job_list.clear()
	for job in $Jobs.get_children():
		GameData.change_resource_number("population", job.number_of_workers)
		$Jobs.remove_child(job)


###############################################################################
############################## Changing the tile ##############################
###############################################################################


func change_tile(tile_category, c_tile_name, print_children = false):
	# Setting tile data
	tile_name = c_tile_name
	tile_category = tile_category
	
	tile_builder.change_tile(self, tile_category, c_tile_name)
	update_tile()
	
	if print_children:
		print(self.get_node("Tile_mesh/building pos").get_child_count())
		
func change_building(building_name):
	building = building_name
	tile_builder.create_building(self, building_name)
	change_building_layer()

func update_tile():
	$TileMesh.material_override = load(tile_material)

# Warning This needs to be moved somewhere else!!!!!!!
func tile_type_interpreter():
	# code from RedBlobGamees
	# perlin noise can generate between -1 to +1
	# Water
	var pv = perlin_value
	
	var current_tile_name = null
	for data in tile_builder.tile_dict.get("generated tiles"):
		if pv < data.get("perlin value"):
			current_tile_name = data.get("name")
			break
	
	tile_builder.change_tile(self, "generated tiles", current_tile_name)
	update_tile()

###############################################################################
############################## Changing the tile ##############################
###############################################################################

################################
# Duplicating tile data to ui  #
################################


func duplicate_tile_output():
	var data = {
		"name" : tile_name,
		"type" : tile_category, 
		"material" : $TileMesh.material_override, 
		"building name" : building
		}
	return data


func duplicate_tile_input(data):
	tile_name = data.get("name")
	tile_category = data.get("type")
	$TileMesh.material_override = data.get("material")
	tile_builder.create_building(self, data.get("building name"))
	building = data.get("building name")
	change_building_layer()

################################
# Duplicating tile data to ui  #
################################


func move_tile():
	if state == "rise":
		position.y = (perlin_value * altidude_offset) + .3
		scale = Vector3(1.5, 1.5, 1.5)
	elif state== "idle":
		position.y = (perlin_value * altidude_offset)
		scale = Vector3(1, 1, 1)


func change_building_layer():
	var building_pos = $"BuildingPos"
	if building_pos.get_children() and display_tile:
			var building_model = building_pos.get_child(0).get_child(0)
			building_model.layers = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	if display_tile:
		$TileMesh.layers = 2
		change_building_layer()
	if perlin_value:
		tile_type_interpreter()
	


func _process(_delta):
	move_tile()


func _on_mouse_entered():
	state = "rise"


func _on_mouse_exited():
	state = "idle"
