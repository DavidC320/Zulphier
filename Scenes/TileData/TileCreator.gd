extends "res://Scenes/TileData/Tile_data.gd"

var tile_scene = preload("res://Scenes/TileData/TileBase.tscn")
var job_scene = preload("res://Scenes/TileData/Jobs/job_data.tscn")


######################
# BUILDING FUNCTIONS #
######################

func contruction_bonus(tile, value_change = 1):
	var bonuses = building_dict.get(tile.building).get("building effects")
	
	if not tile.display_tile:
		
		for bonus in bonuses:
			var resource = bonus[0]
			var number = bonus[1] * value_change
			GameData.change_resource_number(resource, number)

func load_building_model(building_name):
	"used to get the glb file for a building"
	var building = building_dict.get(building_name).get("model")
	var loaded_building = null
	
	if building: # loads the model could be found
		loaded_building = load(building).instantiate()
	else: # loads an error model if model couldn't be found
		loaded_building = load("res://resources/Models/No loaded Building.glb").instantiate()
	
	return loaded_building
	
func delete_building_model(tile):
	"deletes the current building on a tile"
	var building_node = tile.get_node("TileMesh/BuildingPos")
	if building_node.get_children():
		var current_building = building_node.get_child(0)
		building_node.remove_child(current_building)
		tile.clear_jobs()
		contruction_bonus(tile, -1)
		tile.building = null

func create_building(tile, building_name):
	"""This function is different from add building due to this being used to 
	directly change the current building directly"""
	if building_name:
		
		# adding the building model into the building spatial
		# if the tile has a building
		delete_building_model(tile)
		var building_data = building_dict.get(building_name)
		
		tile.building = building_name
		tile.building_name = building_data.get("name")
		
		# get available items
		var availabe_buildings = building_data.get("available buildings")
		if availabe_buildings == null:
			availabe_buildings = []
		tile.building_buildings = availabe_buildings
		var availabe_tiles = building_data.get("available tiles")
		if availabe_tiles == null:
			availabe_tiles = []
		tile.building_tiles = availabe_tiles
		
		var loaded_building = load_building_model(building_name)
		var building_node = tile.get_node("TileMesh/BuildingPos")
		building_node.add_child(loaded_building)
		
		
		var building_settings = building_data.get("settings")
		var setting_data = settings_dict.get(building_settings)
		
		# getting the jobs of the building
		var jobs = setting_data.get("jobs")
		tile.clear_jobs()
		for job in jobs:
			var job_node = job_scene.instantiate()
			job_node.set_job(job)
			tile.add_job(job_node)
			
		# getting the creation bonus for a building
		contruction_bonus(tile, 1)
	else:
		delete_building_model(tile)


func add_building(tile, tile_data):
	"This is used to generate buildings on world creation"
# can have buildings
	var prebuild = tile_data.get("create building")
	var available_buildings = tile.tile_buildings
	
	if prebuild and available_buildings:
		var building_name = null
		if prebuild == "random":
			building_name = random_from_list(available_buildings)
			tile.building = building_name
			
		if building_name:
			create_building(tile, building_name)

######################
# BUILDING FUNCTIONS #
######################


func random_from_list(list_ob):
	var random_index = randi() % list_ob.size()
	if list_ob[random_index]:
		return list_ob[random_index]


func change_tile(tile, tile_name):
	var tile_data = dictonary_of_tiles.get(tile_name)
	if tile_data:
		# tile name
		tile.tile_name = tile_data.get("name")
		# tile material
		tile.tile_material = tile_data.get("material")
		# tile buildins
		tile.tile_buildings = tile_data.get("available buildings")
		# tile tiles
		tile.tile_tiles = tile_data.get("available tiles")
		
		add_building(tile, tile_data)
		
