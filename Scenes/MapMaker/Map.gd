extends Node3D
# Perlin stuff learned from Dave the Dev
@export var tile_type_noise = FastNoiseLite.new()

# Basis stuff
var tile_base = preload("res://Scenes/TileData/TileBase.tscn")
var grid = []

func starting_cord(number, tile_size, padding) -> int:
	return (number/2 - tile_size/2 - padding) * -1

func create_tile(x, z, true_x, true_z, noise_scale, altitude_offset):
	var tile = tile_base.instantiate()
	
	var amplified_x = x * noise_scale
	var amplified_z = z * noise_scale
	var altitude = tile_type_noise.get_noise_2d(amplified_x, amplified_z) 
	var current_tile_name = null
	for data in TileChanger.tile_generation_map:
		if altitude < data[0]:
			current_tile_name = data[1]
			break
	print(tile)
	print(current_tile_name)
	print(true_x, true_z)
	add_child(tile)
	tile.change_tile(current_tile_name)
	
	tile.column = true_x
	tile.row = true_z
	tile.global_position = Vector3(x, altitude * altitude_offset, z)
	return tile

func create_map(map_size, tile_size, padding, noise_scale, altitude_offset=0):
	tile_type_noise.seed = randi()
	var columns = map_size
	var rows = map_size
	var starting_x = starting_cord(map_size, tile_size, padding)
	var starting_z = starting_cord(map_size, tile_size, padding)
	var camera_clamp = [starting_x, starting_z]
	
	
	var x = starting_x
	var z = starting_z
	var t_x = 0
	var t_z = 0
	for col_num in columns:
		var tile_row = []
		for row_num in rows:
			var created_tile = create_tile(x, z, t_x, t_z, noise_scale, altitude_offset)
			tile_row.append(created_tile)
			x += tile_size + padding
			t_x += 1
		grid.append(tile_row)
		x = starting_x
		t_x = 0
		z += tile_size + padding
		t_z += 1
	
	var dungeon_tile = grid[floor(rows/2)][floor(columns/2)]
	dungeon_tile.change_tile("dungeon floor")
	GameData.map_data = grid
	return camera_clamp


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
