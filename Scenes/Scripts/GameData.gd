extends Node

# map data
var map_data:Array = []
var selected_tile

var map_size = 11
var padding = 0.0
var noise_scale = 4
var tile_altidude= 4

# signals

signal resource_changed
signal center_created

# varibles
var money = 0
var money_cap = 0

var population = 0
var population_cap = 0

var wood = 0
var wood_cap = 0

var food = 0
var food_cap = 0

var minerals = 0
var mineral_cap = 0

var center = 0


func check_show(item_data, connection):
	var show = true
	var show_checks = item_data.get("show")
	if show_checks == null:
		show_checks = []

	if "anywhere" in show_checks:
		show = true
	else:
		show = connection
	
	for check in show_checks:
		if check == "only":
			for tile_row in map_data:
				for tile in tile_row:
					if tile.building_name == item_data.get("name"):
						show = false
	return show


func check_connection_type(tile):
	if tile.tile_name.to_lower() in ["road", "foundation", "dock"] or tile.building_name.to_lower() == "town center":
		return true
	return false

func check_for_connections():
	var column = selected_tile.column
	var row = selected_tile.row
	var start_column = column -1
	var start_row = row -1
	var map_size = map_data.size()
	var t_column = start_column
	var t_row = start_row

	for num in range(3):
		for num2 in range(3):
			var past_map_y = t_column >= 0 and t_column < map_size
			var past_map_x = t_row >= 0 and t_row < map_size
			if past_map_x and past_map_y:
				var tile = map_data[t_row][t_column]
				if check_connection_type(tile):
					return true
			t_column += 1
		t_column = start_column
		t_row += 1
	return false
		



func cost_interp(costs, value=1):
	for cost in costs:
		change_resource(cost[0], cost[1]*value)

func get_new_total(current_total, number_change, cap, use_cap = true, can_debt= false):
	var new_total = current_total + number_change

	if new_total > cap and not use_cap:
		new_total = cap
	elif new_total < 0 and not can_debt:
		new_total = 0
	return new_total


func change_resource(resource:String, number:int):

	if resource == "money":
		money = get_new_total(money, number, money_cap)
	elif resource == "money cap":
		money_cap = get_new_total(money_cap, number, 999, false)
	
	elif resource == "population":
		population = get_new_total(population, number, population_cap)
	elif resource == "population cap":
		population_cap = get_new_total(population_cap, number, 999, false)
	
	elif resource == "wood":
		wood = get_new_total(wood, number, wood_cap)
	elif resource == "wood cap":
		wood_cap = get_new_total(wood_cap, number, 999, false)
	
	elif resource == "food":
		food = get_new_total(food, number, food_cap)
	elif resource == "food cap":
		food_cap = get_new_total(food_cap, number, 999, false)
	
	elif resource == "minerals":
		minerals = get_new_total(minerals, number, mineral_cap)
	elif resource == "mineral cap":
		mineral_cap = get_new_total(mineral_cap, number, 999, false)
	
	elif resource == "center":
		center = get_new_total(center, number, 2)
	emit_signal("resource_changed")

func check_list_of_cost(cost_list:Array):
	for cost in cost_list:
		var resource = cost[0]
		var number = cost[1]
		if not check_resources(resource, number):
			return false
	return true

func check_resources(resource_name:String, change_number:int):
	var number = abs(change_number)
	var resource_dict = {
		"money" : money,
		"population" : population,
		"wood" : wood,
		"food" : food,
		"minerals" : minerals
	}

	var total = resource_dict.get(resource_name)
	if number <= total:
		return true
	return false
