extends Node
# scripts

var tileData = load("res://Scenes/Scripts/TileData.gd").new()
var buildingData = load("res://Scenes/Scripts/BuildingData.gd").new()
var decorationData = load("res://Scenes/Scripts/DecorationData.gd").new()

# Tile data
var tile_dictonary:Dictionary = self.list_to_dict_converter(tileData.tile_list)
var tile_generation_map:Array = tileData.perlin_gnerate_tile_list

# Building data
var building_dictonary:Dictionary = self.list_to_dict_converter(buildingData.building_list)
var building_settings:Dictionary = buildingData.settings_dict

# Decoration data
var decoration_dictonary:Dictionary = self.list_to_dict_converter(decorationData.decoration_list)

var job_scene = preload("res://Scenes/TileData/Jobs/job_data.tscn")

func list_to_dict_converter(dictonary):
	var new_dict = {}
	for item in dictonary:
		var item_name = item.get("name").to_lower()
		new_dict[item_name] = item
	return new_dict


######################
# BUILDING FUNCTIONS #
######################
func contruction_bonus(building_base, value_change= 1):  #changed
	if not building_base.display_tile:
		for bonus in building_base.bonuses:
			var resource = bonus[0]
			var number = bonus[1] * value_change
			GameData.change_resource(resource, number)


func generate_building(tile, tile_data):
	"This is used to generate buildings on world creation"
# can have buildings
	var prebuild = tile_data.get("create building")
	var available_buildings = tile.tile_buildings
	
	if prebuild and available_buildings:
		var building_name = null
		if prebuild == "random":
			building_name = random_from_list(available_buildings)
			
		if building_name:
			tile.building.create_building(building_name)

######################
# BUILDING FUNCTIONS #
######################


func random_from_list(list_ob):
	var random_index = randi() % list_ob.size()
	if list_ob[random_index]:
		return list_ob[random_index]


func change_tile(tile, tile_name):
	var tile_data = tile_dictonary.get(tile_name)
	if tile_data:
		tile.tile_name = tile_data.get("name")
		tile.tile_material = tile_data.get("material")
		tile.tile_buildings = tile_data.get("available buildings")
		tile.tile_tiles = tile_data.get("available tiles")
		
		generate_building(tile, tile_data)
		tile.building.set_level()
		
