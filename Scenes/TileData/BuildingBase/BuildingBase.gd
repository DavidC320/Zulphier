extends Node3D
# building data
var building_name:String
var building_present = false
@export var display_tile = false

# building leveling
var building_settings = {}
var maxed_level = false
var building_level:int = 1
var building_exp:int = 0
var building_level_up:int = 100
var building_levels = []  # a list of ints that are used to see how much till the next level.

# avialbes
var available_buildings = []
var available_tiles = []
var available_decorations = []
var bonuses = []

# Decoration bonus 
var worker_cap_bonus:int = 0
var resource_bonus:float = 1.0
var job_time_decrease:float = 1.0

signal exp_change
signal level_up

var job_scene = preload("res://Scenes/TileData/Jobs/job_data.tscn")

# spots
@onready var building_spot = $buildingSpot
@onready var NW_spot = $Decoration/NW_Deco
@onready var NE_spot = $Decoration/NE_Deco
@onready var SW_spot = $Decoration/SW_Deco
@onready var SE_spot = $Decoration/SE_Deco

# jobs
@onready var job_list = $Jobs

##################
# MISC FUNCTIONS #
##################
func list_checker(list_item):
	"This is used to return a list if it is null."
	if list_item == null:
		list_item = []
	return list_item


func get_building_data():
	return [available_buildings, available_tiles, available_decorations, job_list.get_children()]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
##################
# MISC FUNCTIONS #
##################

#####################
# Changing building #
#####################
func load_buidling_model(building_model_path):
	var model
	if building_model_path:
		model = load(building_model_path).instantiate()
	else:
		model = load("res://resources/Models/No loaded Building.glb").instantiate()
	if display_tile:
		model.get_child(0).layers = 2
	
	building_spot.add_child(model)


func change_building(building_data_name):
	print(building_data_name)
	building_level = 1
	building_exp = 0
	create_building(building_data_name)
	set_level()


func create_building(new_building_name):
	remove_building()
	if new_building_name == null:
		return
	elif new_building_name == "":
		return
	else:
		var new_building = TileChanger.building_dictonary.get(new_building_name)
		if new_building == null:
			print("this building doesn't exitst| " + new_building_name)
			return
		clear_jobs()
		
		# General info
		building_name = new_building.get("name")
		load_buidling_model(new_building.get("model"))
		building_present = true
		bonuses = new_building.get("building effects")
		TileChanger.contruction_bonus(self)
		# avaible items
		available_buildings = list_checker(new_building.get("available buildings"))
		available_decorations = list_checker(new_building.get("available decorations"))
		available_tiles = list_checker(new_building.get("avaialble tiles"))
		
		# jobs and levels
		var settings_data = TileChanger.building_settings.get(new_building.get("settings"))
		building_levels = list_checker(settings_data.get("levels"))
		var jobs = settings_data.get("jobs")
		for job in jobs:
			var job_node = job_scene.instantiate()
			job_node.set_job(job)
			add_job(job_node)


func remove_building():
	building_present = false
	print(building_spot.get_children())
	if building_spot.get_child_count() > 0:
		building_spot.get_child(0).queue_free()
		clear_jobs()
		clear_decorations()
		TileChanger.contruction_bonus(self, -1)
		building_present = true
#####################
# Changing building #
#####################


########################
# Decoration functions #
########################
func get_duplicaion_data():
	var duplicate_data_list = []
	var deco_spots = {
		"NW" : NW_spot,
		"NE" : NE_spot,
		"SW" : SW_spot,
		"SE" : SE_spot
	}
	for deco in get_decoration_spots("full"):
		var spot = deco_spots.get(deco)
		var data = [spot.deco_name.to_lower(), deco]
		duplicate_data_list.append(data)
	return duplicate_data_list


func get_decoration_spots(mode):
	print("get decor mode: " + mode)
	var deoc_spots = []
	var deco_names = ["NW", "NE", "SW", "SE"]
	var deco_name_index = 0
	for deco_spot in [NW_spot, NE_spot, SW_spot, SE_spot]:
		if not deco_spot.has_deco and mode == "empty":
			var deco_name = deco_names[deco_name_index]
			deoc_spots.append(deco_name)
		elif deco_spot.has_deco and mode == "full":
			var deco_name = deco_names[deco_name_index]
			deoc_spots.append(deco_name)
		deco_name_index += 1
	return deoc_spots


func add_decoration(deco_name, add_mode:String = "empty"):
	var empty_decos = get_decoration_spots("empty")
	var deco_spots = {
		"NW" : NW_spot,
		"NE" : NE_spot,
		"SW" : SW_spot,
		"SE" : SE_spot
	}
	if empty_decos.size() > 0 and add_mode == "empty":
		var deco_spot = deco_spots.get(empty_decos[0])
		deco_spot.create_decoration(deco_name, display_tile)
	elif add_mode in ["NW", "NE", "SW", "SE"]:
		var deco_spot = deco_spots.get(add_mode)
		deco_spot.create_decoration(deco_name, display_tile)


func remove_decoration(deco_spot:String):
	var deco_spots = {
		"NW" : NW_spot,
		"NE" : NE_spot,
		"SW" : SW_spot,
		"SE" : SE_spot
	}
	var selected_spot = deco_spots.get(deco_spot)
	if selected_spot == null:
		print("There was an error| %s" % deco_spot)
	else:
		selected_spot.remove_decoration()

func clear_decorations():
	for deco_spot in [NW_spot, NE_spot, SW_spot, SE_spot]:
		deco_spot.remove_decoration()
########################
# Decoration functions #
########################


#################
# Job functions #
#################
func add_job(job_node):
	if not display_tile:
		job_node.job_completed.connect(func(): add_exp(job_node.job_exp))
		$Jobs.add_child(job_node)


func clear_jobs():
	if not display_tile:
		for job in $Jobs.get_children():
			GameData.change_resource("population", job.number_of_workers)
			job.queue_free()


func set_level():
	if building_levels.size() < building_level:
		maxed_level = true
		return
	
	var exp_needed_index = building_level - 1
	var exp_need = building_levels[exp_needed_index]
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
#################
# Job functions #
#################
