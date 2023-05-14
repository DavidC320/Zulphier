extends Node3D
# building data
var building_name:String

# building leveling
var maxed_level = false
var building_level:int = 1
var building_exp:int = 0
var building_level_up:int = 100
var building_levels = []  
# a list of ints that are used to see how much till the next level.

var building_settings = {}
var available_buildings = []
var available_tiles = []

@export var display_tile = false

signal exp_change
signal level_up


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
