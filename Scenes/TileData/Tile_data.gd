var list_of_raw_tile_data = [
	{
		"name" : "Water",
		"material" : "res://resources/materials/water.tres",
		"create building" : false,
		"show" : [],
		"available buildings" : [],
		"available tiles" : ["dock"]
	},
	{
		"name" : "Sand",
		"material" : "res://resources/materials/sand.tres",
		"create building" : false,
		"show" : [],
		"available buildings" : ["town center", "larder"],
		"available tiles" : ["road", "foundation"]
	},
	{
		"name" : "Grass",
		"material" : "res://resources/materials/grass.tres",
		"create building" : false,
		"show" : [],
		"available buildings" : ["town center", "house", "warehouse"],
		"available tiles" : ["road", "foundation"]
	},
	{
		"name" : "Forest",
		"material" : "res://resources/materials/forest.tres",
		"create building" : false,
		"show" : [],
		"available buildings" : ["town center", "lumber mill", "lumber yard"],
		"available tiles" : ["road", "foundation"]
	},
	{
		"name" : "Mountain",
		"material" : "res://resources/materials/mountain.tres",
		"create building" : false,
		"show" : [],
		"available buildings" : ["mine", "stone yard"],
		"available tiles" : ["road", "foundation"]
	},
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
		"desc" : "Go beyond land and spread creating fisheries and homes.",
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

var perlin_gnerate_tile_list = [
	[-0.1, "water"],
	[0.0, "sand"],
	[0.1, "grass"],
	[0.2, "forest"],
	[1.0, "mountain"]
]

var settings_dict = {
	"dungeon settings" : {
		"type" : "dungeon",
		"levels" : [
			5, # 1 5
			20, # 2 50
			100 # 3 500
		],
		"building effects" : [],
		"jobs" : [
			{
				"name" : "Explore",
				"show" : [],
				"exp" : 1,
				"description": "Send your intreped heroes into the depths",
				"worker cap" : 4,
				"time" : 120,
				"rewards" : [["population", 1]]
			},
			{
				"name" : "Raid",
				"show" : [["level", 2]],
				"exp" : 10,
				"description": "Send your intreped heroes into the depths",
				"worker cap" : 4,
				"time" : 240,
				"rewards" : [["food", 2], ["wood", 2], ["minerals", 2]]
			}
			,
			{
				"name" : "Conquer",
				"show" : [["level", 3]],
				"exp" : 100,
				"description": "Send your intreped heroes into the depths",
				"worker cap" : 4,
				"time" : 480,
				"rewards" : [["money", 20]]
			}
		]
	},
	
	"house settings" : {
		"type" : "storage",
		"worker limit" : 0,
		"building effects" : [["population cap", 2], ["population", 2]],
		"jobs" : [],
	},
	
	"lumber mill settings" : {
		"type" : "producer",
		"building effects" : [],
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
		"building effects" : [],
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
		"building effects" : [],
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
		"building effects" : [["wood cap", 2], ["money cap", 2], ["food cap", 2], ["mineral cap", 2]],
		"jobs" : []
	},
	
	"vault settings" : {
		"type" : "storage",
		"building effects" : [["money cap", 4]],
		"jobs" : []
	},
	
	"lumber yard settings" : {
		"type" : "storage",
		"building effects" : [["wood cap", 4]],
		"jobs" : []
	},
	
	"larder settings" : {
		"type" : "storage",
		"building effects" : [["food cap", 4]],
		"jobs" : []
	},
	
	"stone yard settings" : {
		"type" : "storage",
		"building effects" : [["mineral cap", 4]],
		"jobs" : []
		
	},
	"gilded settings" : {
		"type" : "storage",
		"jobs" : []
		
	},
	
	"town center settings" : {
		"type" : "storage",
		"building effects" : [
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
		"building effects" : [],
		"cost" : [],
		"show" : [],
		"available buildings" : ["gilded tower"],
		"available tiles" : [],
		"model" : "res://resources/Models/Dark Tower.glb"
	},
	"dark fortress" : { # dark fortress
		"name" : "Dark Fortress",
		"settings" : "dungeon settings",
		"desc" : "A prison for those taken as hostages. The screams tear through you.",
		"building effects" : [],
		"cost" : [],
		"show" : [],
		"available buildings" : ["gilded fortress"],
		"available tiles" : [],
		"model" : "res://resources/Models/Dark Fortress.glb"
	},
	"dark pit" : {
		"name" : "Dark Pit",
		"settings" : "dungeon settings",
		"desc" : "A deep hole full of dark horrors. Many see groutesque monstrosites emerge from their hive.",
		"building effects" : [],
		"cost" : [],
		"show" : [],
		"available buildings" : ["gilded pit"],
		"available tiles" : [],
		"model" : "res://resources/Models/Dark Pit.glb"
	},
	"dark portal" : {
		"name" : "Dark Portal",
		"settings" : "dungeon settings",
		"desc" : "A ancient structure linking the plane of Doamos to some twisted reality. The glow draws in it's prey.",
		"building effects" : [],
		"cost" : [],
		"show" : [],
		"available buildings" : ["gilded portal"],
		"available tiles" : [],
		"model" : "res://resources/Models/Dark Portal.glb"
	},
	"dark castle" : {
		"name" : "Dark Castle",
		"settings" : "dungeon settings",
		"desc" : "A bastion of an evil long since reawaken. Many hear maniacal laughter from within the hold.",
		"building effects" : [],
		"cost" : [],
		"show" : [],
		"available buildings" : ["gilded castle"],
		"available tiles" : [],
		"model" : "res://resources/Models/Dark Castle.glb"
	},
	
####################################################################################################
######################################## Conquered dungeons ########################################
####################################################################################################

	"gilded tower" : {
		"name" : "Gilded Tower",
		"settings" : "gilded settings",
		"desc" : "A watch tower fit for a high wizard.",
		"building effects" : [["conquer", 1]],
		"cost" : [],
		"show" : [["level", 4]],
		"model" : "res://resources/Models/Gilded_dungeons/Gilded_Tower.glb"
	},
	"gilded fortress" : { # dark fortress
		"name" : "Gilded Fortress",
		"settings" : "gilded settings",
		"desc" : "A Barrack for to train elite.",
		"building effects" : [["conquer", 1]],
		"cost" : [],
		"show" : [["level", 4]],
		"model" : "res://resources/Models/Gilded_dungeons/Gilded_Fortress.glb"
	},
	"gilded pit" : {
		"name" : "Gilded Pit",
		"settings" : "gilded settings",
		"desc" : "A deep hole full of ores unkown to man.",
		"building effects" : [["conquer", 1]],
		"cost" : [],
		"show" : [["level", 4]],
		"model" : "res://resources/Models/Gilded_dungeons/Gilded_Pit.glb"
	},
	"gilded portal" : {
		"name" : "Gilded Portal",
		"settings" : "gilded settings",
		"desc" : "A worm whole to a pocket demension for stroage.",
		"building effects" : [["conquer", 1]],
		"cost" : [],
		"show" : [["level", 4]],
		"model" : "res://resources/Models/Gilded_dungeons/Gilded_Portal.glb"
	},
	"gilded castle" : {
		"name" : "Gilded Castle",
		"settings" : "gilded settings",
		"desc" : "A bastion of trade. May thee be conenctd with the world",
		"building effects" : [["conquer", 1]],
		"cost" : [],
		"show" : [["level", 4]],
		"model" : "res://resources/Models/Gilded_dungeons/Gilded_Castle.glb"
	},
	
###############################################################################
############################ Player made buildings ############################
###############################################################################
	
	"town center" : {
		"name" : "Town Center",
		"settings" : "town center settings",
		"desc" : "The heart of your town, A weak heart doesn't beat.",
		"building effects" : [
			["money cap", 10], ["money", 4],
			["population cap", 4], ["population", 4], 
			["wood cap", 4], ["wood", 4],
			["food cap", 6], ["food", 4],
			["mineral cap", 4], ["minerals", 4],
			["center", 1]
			],
		"cost" : [],
		"show" : ["only", "anywhere"],
		"model" : "res://resources/Models/Buildings/center.glb"
	},
	
	"house" : {
		"name" : "House",
		"settings" : "house settings",
		"desc" : "A building that increases the population cap of your settlment",
		"building effects" : [["population cap", 2], ["population", 2]],
		"cost" : [["wood", 1]],
		"show" : [],
		"model" : "res://resources/Models/House.glb"
	},
	"warehouse" : {
		"name" : "Warehouse",
		"settings" : "warehouse settings",
		"desc" : "A building that store a lot of different resources",
		"building effects" : [["wood cap", 2], ["money cap", 2], ["food cap", 2], ["mineral cap", 2]],
		"cost" : [["wood", 2]],
		"show" : [],
		"model" : "res://resources/Models/Buildings/Warehouse.glb"
	},
	"vault" : {
		"name" : "Vault",
		"settings" : "vault settings",
		"desc" : "Store you precous gold here.",
		"building effects" : [["money cap", 4]],
		"cost" : [["wood", 1], ["minerals", 1]],
		"show" : [],
		"model" : "res://resources/Models/Buildings/Vault.glb"
		
	},
	"lumber yard" : {
		"name" : "Lumber Yard",
		"settings" : "lumber yard settings",
		"desc" : "A peice of land used to store lumber",
		"building effects" : [["wood cap", 4]],
		"cost" : [["wood", 2]],
		"show" : [],
		"model" : "res://resources/Models/Buildings/Woodyard.glb"
		
	},
	"lumber mill" : {
		"name" : "Lumber Mill",
		"settings" : "lumber mill settings",
		"desc" : "Cut down trees to gain wood to contruct grand buildings",
		"building effects" : [],
		"cost" : [["wood", 1]],
		"show" : [],
		"model" : "res://resources/Models/Lumber mill.glb"
	},
	"larder" : {
		"name" : "Larder",
		"settings" : "larder settings",
		"desc" : "A place to store food",
		"building effects" : [["food cap", 4]],
		"cost" : [["wood", 2]],
		"show" : [],
		"model" : "res://resources/Models/Buildings/Tradecenter.glb"
	},
	"fishery" : {
		"name" : "Fishery",
		"settings" : "fishery settings",
		"desc" : "A dock to catch the life of the sea.",
		"building effects" : [],
		"cost" : [["wood", 1]],
		"show" : [],
		"model" : "res://resources/Models/Fishery.glb"
	},
	"stone yard" : {
		"name" : "Stone yard",
		"settings" : "stone yard settings",
		"desc" : "A place to put all of those stones and minerals at.",
		"building effects" : [["mineral cap", 4]],
		"cost" : [["minerals", 2]],
		"show" : [],
		"model" : "res://resources/Models/Buildings/Stoneyard.glb"
	},
	"mine" : {
		"name" : "Mine",
		"settings" : "mine settings",
		"building effects" : [],
		"desc" : "",
		"cost" : [["minerals", 1]],
		"show" : [],
		"model" : "res://resources/Models/Mine.glb"
	}
}
var dictonary_of_tiles = self.list_to_dict_converter(list_of_raw_tile_data)

func list_to_dict_converter(dictonary):
	var new_dict = {}
	for item in dictonary:
		var name = item.get("name").to_lower()
		new_dict[name] = item
	return new_dict
