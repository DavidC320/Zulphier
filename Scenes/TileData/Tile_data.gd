var tile_dict = {
	"generated tiles" : [
		{
			"name" : "Water",
			"material" : "res://resources/materials/water.tres",
			"perlin value" : -0.1,
			"create building" : false,
			"show" : [],
			"available buildings" : [],
			"available tiles" : [["other tiles" ,"Dock"]]
		},
		{
			"name" : "Sand",
			"material" : "res://resources/materials/sand.tres",
			"perlin value" : 0.0,
			"create building" : false,
			"show" : [],
			"available buildings" : ["larder", "town center"],
			"available tiles" : [["other tiles" ,"Road"], ["other tiles", "Foundation"]]
		},
		{
			"name" : "Grass",
			"material" : "res://resources/materials/grass.tres",
			"perlin value" : 0.1,
			"create building" : false,
			"show" : [],
			"available buildings" : ["house", "warehouse", "town center"],
			"available tiles" : [["other tiles" ,"Road"], ["other tiles", "Foundation"]]
		},
		{
			"name" : "Forest",
			"material" : "res://resources/materials/forest.tres",
			"perlin value" : 0.2,
			"create building" : false,
			"show" : [],
			"available buildings" : ["lumber mill", "lumber yard", "town center"],
			"available tiles" : [["other tiles" ,"Road"], ["other tiles", "Foundation"]]
		},
		{
			"name" : "Mountain",
			"material" : "res://resources/materials/mountain.tres",
			"perlin value" : 1.0,
			"create building" : false,
			"show" : [],
			"available buildings" : ["mine", "stone yard"],
			"available tiles" : [["other tiles" ,"Road"], ["other tiles", "Foundation"]]
		}
	],
	"other tiles" : [
		{
			"name" : "Dungeon Floor",
			"material" : "res://resources/materials/dungeon.tres",
			"perlin value" : null,
			"create building" : "random",
			"show" : [],
			"available buildings" : ["dark tower", "dark fortress", "dark pit", "dark portal", "dark castle"],
			"available tiles" : []
		},
		{
			"name" : "Dock",
			"material" : "res://resources/materials/dock.tres",
			"perlin value" : null,
			"create building" : false,
			"show" : [],
			"cost" : [["wood", 2]],
			"available buildings" : ["fishery", "house", "warehouse", "larder"],
			"available tiles" : []
		},
		{
			"name" : "Road",
			"desc" : "The veins of any town, You can build around any road tile",
			"material" : "res://resources/materials/road.tres",
			"perlin value" : null,
			"create building" : false,
			"show" : [],
			"cost" : [["minerals", 1]],
			"available buildings" : [],
			"available tiles" : []
		},
		{
			"name" : "Foundation",
			"desc" : "No longer land locked, as with the road you can build around it.",
			"material" : "res://resources/materials/Foundation.tres",
			"perlin value" : null,
			"create building" : false,
			"show" : [],
			"cost" : [["minerals", 2]],
			"available buildings" : ["house", "mine", "warehouse", "vault"],
			"available tiles" : []
		}
	]
}

var settings_dict = {
	"dungeon settings" : {
		"type" : "dungeon",
		"building affects" : [],
		"jobs" : [
			{
				"name" : "Explore",
				"description": "Send your intreped heroes into the depths",
				"worker cap" : 4,
				"time" : 120,
				"rewards" : [["money", 100]]
			}
		]
	},
	
	"house settings" : {
		"type" : "storage",
		"worker limit" : 0,
		"building affects" : [["population cap", 2], ["population", 2]],
		"jobs" : [],
	},
	
	"lumber mill settings" : {
		"type" : "producer",
		"building affects" : [],
		"jobs" : [
			{
				"name" : "Cut Wood",
				"description": "Have your workers cut wood",
				"worker cap" : 2,
				"time" : 30,
				"rewards" : [["wood", 1]]
			}
		],
	},
	
	"fishery settings" : {
		"type" : "producer",
		"building affects" : [],
		"jobs" : [
			{
				"name" : "Fish",
				"description": "Have your workers catch fish",
				"worker cap" : 2,
				"time" : 30,
				"rewards" : [["food", 1]]
			}
		],
	},
	
	"mine settings" : {
		"type" : "producer",
		"building affects" : [],
		"jobs" : [
			{
				"name" : "Mine",
				"description": "Have your workers collect minerals",
				"worker cap" : 2,
				"time" : 30,
				"rewards" : [["minerals", 1]]
			}
		],
	},

	"warehouse settings" : {
		"type" : "storage",
		"building affects" : [["wood cap", 2], ["money cap", 2], ["food cap", 2], ["mineral cap", 2]],
		"jobs" : []
	},
	
	"vault settings" : {
		"type" : "storage",
		"building affects" : [["money cap", 4]],
		"jobs" : []
	},
	
	"lumber yard settings" : {
		"type" : "storage",
		"building affects" : [["wood cap", 4]],
		"jobs" : []
	},
	
	"larder settings" : {
		"type" : "storage",
		"building affects" : [["food cap", 4]],
		"jobs" : []
	},
	
	"stone yard settings" : {
		"type" : "storage",
		"building affects" : [["mineral cap", 4]],
		"jobs" : []
		
	},
	
	"town center settings" : {
		"type" : "storage",
		"building affects" : [
			["money cap", 10], ["money", 4],
			["population cap", 4], ["population", 4], 
			["wood cap", 4], ["wood", 4],
			["food cap", 6], ["food", 4],
			["mineral cap", 4], ["minerals", 4],
			["center", 1]
			],
		"jobs" : []
	}
}

var building_dict = {
	"dark tower" : {
		"name" : "Dark Tower",
		"settings" : "dungeon settings",
		"desc" : "A looming tower of arcane chaos. You feel an unbarable precesne staring into you.",
		"cost" : [],
		"show" : [],
		"model" : "res://resources/Models/Dark Tower.glb"
	},
	"dark fortress" : {
		"name" : "Dark Fortress",
		"settings" : "dungeon settings",
		"desc" : "A prison for those taken as hostages. The screams tear through you.",
		"cost" : [],
		"show" : [],
		"model" : "res://resources/Models/Dark Fortress.glb"
	},
	"dark pit" : {
		"name" : "Dark Pit",
		"settings" : "dungeon settings",
		"desc" : "A deep hole full of dark horrors. Many see groutesque monstrosites emerge from their hive.",
		"cost" : [],
		"show" : [],
		"model" : "res://resources/Models/Dark Pit.glb"
	},
	"dark portal" : {
		"name" : "Dark Portal",
		"settings" : "dungeon settings",
		"desc" : "A ancient structure linking the plane of Doamos to some twisted reality. The glow draws in it's prey.",
		"cost" : [],
		"show" : [],
		"model" : "res://resources/Models/Dark Portal.glb"
	},
	"dark castle" : {
		"name" : "Dark Castle",
		"settings" : "dungeon settings",
		"desc" : "A bastion of an evil long since reawaken. Many hear maniacal laughter from within the hold.",
		"cost" : [],
		"show" : [],
		"model" : "res://resources/Models/Dark Castle.glb"
	},
	
###############################################################################
############################ Player made buildings ############################
###############################################################################
	
	"town center" : {
		"name" : "Town Center",
		"settings" : "town center settings",
		"desc" : "The heart of your town, A weak heart doesn't beat.",
		"cost" : [],
		"show" : ["only", "anywhere"],
		"model" : null
	},
	
	"house" : {
		"name" : "House",
		"settings" : "house settings",
		"desc" : "A building that increases the population cap of your settlment",
		"cost" : [["wood", 1]],
		"show" : [],
		"model" : "res://resources/Models/House.glb"
	},
	"warehouse" : {
		"name" : "Warhouse",
		"settings" : "warehouse settings",
		"desc" : "A building that store a lot of different resources",
		"cost" : [["wood", 2]],
		"show" : [],
		"model" : null
	},
	"vault" : {
		"name" : "Vault",
		"settings" : "vault settings",
		"desc" : "Store you precous gold here.",
		"cost" : [["wood", 1], ["minerals", 1]],
		"show" : [],
		"model" : null
		
	},
	"lumber yard" : {
		"name" : "Lumber Yard",
		"settings" : "lumber yard settings",
		"desc" : "A peice of land used to store lumber",
		"cost" : [["wood", 2]],
		"show" : [],
		"model" : null
		
	},
	"lumber mill" : {
		"name" : "Lumber Mill",
		"settings" : "lumber mill settings",
		"desc" : "Cut down trees to gain wood to contruct grand buildings",
		"cost" : [["wood", 1]],
		"show" : [],
		"model" : "res://resources/Models/Lumber mill.glb"
	},
	"larder" : {
		"name" : "Larder",
		"settings" : "larder settings",
		"desc" : "A place to store food",
		"cost" : [["wood", 2]],
		"show" : [],
		"model" : null
	},
	"fishery" : {
		"name" : "Fishery",
		"settings" : "fishery settings",
		"desc" : "A dock to catch the life of the sea.",
		"cost" : [["wood", 1]],
		"show" : [],
		"model" : "res://resources/Models/Fishery.glb"
	},
	"stone yard" : {
		"name" : "Stone yard",
		"settings" : "stone yard settings",
		"desc" : "A place to put all of those stones and minerals at.",
		"cost" : [["minerals", 2]],
		"show" : [],
		"model" : null
	},
	"mine" : {
		"name" : "Mine",
		"settings" : "mine settings",
		"desc" : "",
		"cost" : [["minerals", 1]],
		"show" : [],
		"model" : "res://resources/Models/Mine.glb"
	}
}
var dictonary_of_tiles = {}

var generated_tiles = self.tile_list_converter("generated tiles")
var other_tiles = self.tile_list_converter("other tiles")

func tile_list_converter(tile_category):
	var tile_list = tile_dict.get(tile_category)
	var tiles = {}
	for tile_data in tile_list:
		var name = tile_data.get("name")
		var text = "sdfjkl;"
		var material = load(tile_data.get("material"))
		var perlin_value = tile_data.get("perlin value")  
		var create_building = tile_data.get("create building")
		var available_buildings = tile_data.get("available buildings")
		var available_tiles = tile_data.get("available tiles")
		var show_ = tile_data.get("show")
		tiles[name] = tile_data
	return tiles

func tile_dictonary():
	dictonary_of_tiles = {
			"generated tiles" : generated_tiles,
			"other tiles" : other_tiles
		}
	return dictonary_of_tiles
