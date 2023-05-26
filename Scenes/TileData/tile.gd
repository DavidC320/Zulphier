extends StaticBody3D


var column:int
var row:int

# tile data
var state = "idle"
var perlin_value = 0
var tile_name = ""
var tile_material = null
var tile_buildings = []  # what can be built on this tile
var tile_tiles = []  # what this tile can be changed to

@export var display_tile = false

# building
@onready var building = $TileMesh/BuildingBase


func get_available_items():
	if building.building_present:
		return building.get_building_data()
	else:
		return [tile_buildings, tile_tiles, [], []]


###############################################################################
############################## Changing the tile ##############################
###############################################################################



func change_tile(tile_c_name, print_children = false):
	# Setting tile data
	tile_name = tile_c_name
	
	TileChanger.change_tile(self, tile_c_name)
	update_tile()
	
	if print_children:
		print(self.get_node("TileMesh/BuildingPos").get_child_count())
		

func change_building(building_data_name):
	building.change_building(building_data_name)


func add_decoration(decoration_name):
	building.add_decoration(decoration_name)

func update_tile():
	$TileMesh.material_override = load(tile_material)

###############################################################################
############################## Changing the tile ##############################
###############################################################################
##################
# Setting levels #
##################
	

##################
# Setting levels #
##################
################################
# Duplicating tile data to ui  #
################################


func duplicate_tile_output():
	var data = {
		"name" : tile_name,
		"material" : $TileMesh.material_override, 
		"building name" : building.building_name.to_lower(),
		"decoration names" : building.get_duplicaion_data()
		}
	return data


func duplicate_tile_input(data):
	tile_name = data.get("name")
	$TileMesh.material_override = data.get("material")
	print("building name:" + data.get("building name"))
	building.change_building(data.get("building name"))
	building.clear_decorations()
	for deco in data.get("decoration names"):
		print(deco)
		building.add_decoration(deco[0], deco[1])

################################
# Duplicating tile data to ui  #
################################
# Called when the node enters the scene tree for the first time.
func _ready():
	if display_tile:
		$TileMesh.layers = 2
		building.display_tile = true
	


func _process(_delta):
	pass


func _on_mouse_entered():
	$"Animations/TileHover".play("TileHover")


func _on_mouse_exited():
	$"Animations/TileHover".play_backwards("TileHover")
	