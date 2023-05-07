extends Node

# map data
var map_data:Array = []

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
    if total > number:
        return true
    return false