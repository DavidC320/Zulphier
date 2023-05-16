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


# building data
var building = null
var building_name = ""

var maxed_level = false
var building_level = 1
var building_exp = 0
var building_level_up = 100
var building_levels = []

var building_settings = {}
var job_list = []
var building_buildings = []  # what can be built on this tile
var building_tiles = []  # what this tile can be changed to

@export var display_tile = false

signal exp_change
signal level_up


func get_available_items():
	var building_pos = $"TileMesh/BuildingPos"
	if building_pos.get_child_count() > 0:
		return [building_buildings, building_tiles, job_list]
	else:
		return [tile_buildings, tile_tiles, []]


func add_job(job_node):
	if not display_tile:
		job_node.job_completed.connect(func(): add_exp(job_node.job_exp))
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
	
	TileChanger.change_tile(self, tile_c_name)
	update_tile()
	
	if print_children:
		print(self.get_node("TileMesh/BuildingPos").get_child_count())
		

func change_building(building_data_name):
	building_level = 1
	building_exp = 0
	building = building_data_name
	TileChanger.create_building(self, building_data_name)
	change_building_layer()
	set_level()

func update_tile():
	$TileMesh.material_override = load(tile_material)

###############################################################################
############################## Changing the tile ##############################
###############################################################################
##################
# Setting levels #
##################

func set_level():
	if building_levels.size() < building_level:
		maxed_level = true
		return
	else:
		maxed_level = false
	
	var exp_needed_index = building_level - 1
	var exp_need = building_levels[exp_needed_index]
	print(exp_need)
	building_level_up = exp_need
		
func add_exp(number):
	if not maxed_level:
		building_exp += number
		if building_exp >= building_level_up:
			building_exp = 0
			building_level += 1
			set_level()
			$Level_up.play()
			emit_signal("level_up")
		emit_signal("exp_change")
	

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
		"building name" : building
		}
	return data


func duplicate_tile_input(data):
	tile_name = data.get("name")
	$TileMesh.material_override = data.get("material")
	TileChanger.create_building(self, data.get("building name"))
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
