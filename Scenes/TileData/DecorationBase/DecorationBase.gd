extends Node3D

var has_deco = false
var deco_name:String
var deco_desc:String
var bonuses:Array
var display_tile = false

@onready var deco_spatial = $DecoSpatial
@export var building_scene:Node

# Future
func get_jobs():
	pass


func add_jobs():
	pass


func remove_jobs():
	pass
#

func load_decoration_model(model_path):
	var loaded_model = null

	if model_path != null:
		loaded_model = load(model_path).instantiate()
	else:
		loaded_model = load("res://resources/Models/No loaded Building.glb").instantiate()
	
	if deco_spatial.get_child_count() > 1:
		deco_spatial.get_child(0).queue_free()
	if display_tile:
		loaded_model.get_child(0).layers = 2
	deco_spatial.add_child(loaded_model)


func create_decoration(decoration_name:String, on_display_tile):
	var new_decoration_data = TileChanger.decoration_dictonary.get(decoration_name)
	if new_decoration_data:
		remove_decoration()
		display_tile = on_display_tile
		has_deco = true
		deco_name = new_decoration_data.get("name")
		deco_desc = new_decoration_data.get("description")
		bonuses = new_decoration_data.get("building effects")
		load_decoration_model(new_decoration_data.get("model"))
		apply_bonuses()

func remove_decoration():
	apply_bonuses(-1)
	if deco_spatial.get_child_count() > 0:
		deco_spatial.get_child(0).queue_free()
	has_deco = false
	deco_name = ""
	deco_desc = ""
	bonuses = []

func apply_bonuses(bonus_multiplier:int = 1):
	var building_data = building_scene
	var worker_bonus = building_data.worker_cap_bonus
	var resource_bonus = building_data.resource_bonus
	var job_decrease = building_data.job_time_decrease
	for bonus in bonuses:
		var bonus_name = bonus[0]
		var bonus_number = bonus[1] * bonus_multiplier
		if bonus_name == "job cap":
			worker_bonus += bonus_number
		elif bonus_name == "resource":
			resource_bonus += bonus_number
		elif bonus_name == "job time":
			job_decrease += bonus_number

	building_data.worker_cap_bonus = worker_bonus
	building_data.resource_bonus = resource_bonus
	building_data.job_time_decrease = job_decrease
	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
