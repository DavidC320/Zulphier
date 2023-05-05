extends SubViewportContainer

func change_tile(selected_tile_data):
	$SubViewport/Node3D/TileVBase.duplicate_tile_input(selected_tile_data)
	
func change_show_tile(tile_category, tile_name):
	$SubViewport/Node3D/TileVBase.change_tile(tile_category, tile_name)
	
func change_show_building(building_name):
	$SubViewport/Node3D/TileVBase.change_building(building_name)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$SubViewport/Node3D/AnimationPlayer.play("RESET")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
