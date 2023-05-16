var settings_dict = {
	"dungeon settings" : {
		"levels" : [5, 20, 100],
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
		"jobs" : [],
	},
	
	"lumber mill settings" : {
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
		"jobs" : []
	},
	
	"vault settings" : {
		"jobs" : []
	},
	
	"lumber yard settings" : {
		"jobs" : []
	},
	
	"larder settings" : {
		"jobs" : []
	},
	
	"stone yard settings" : {
		"jobs" : []
		
	},
	"gilded settings" : {
		"jobs" : []
		
	},
	
	"town center settings" : {
		"jobs" : []
	}
}

var building_list = [
#################
# Dark Dungeons #
#################
{
	"name" : "Dark Tower",
	"category" : "dark structure",
	"settings" : "dungeon settings",
	"desc" : "A looming tower of arcane chaos. You feel an unbarable precesne staring into you.",
	"building effects" : [],
	"cost" : [],
	"show" : [],
	"available buildings" : ["gilded tower"],
	"available tiles" : [],
	"model" : "res://resources/Models/Dark Tower.glb"
},
{
	"name" : "Dark Fortress",
	"category" : "dark structure",
	"settings" : "dungeon settings",
	"desc" : "A prison for those taken as hostages. The screams tear through you.",
	"building effects" : [],
	"cost" : [],
	"show" : [],
	"available buildings" : ["gilded fortress"],
	"available tiles" : [],
	"model" : "res://resources/Models/Dark Fortress.glb"
},
{
	"name" : "Dark Pit",
	"category" : "dark structure",
	"settings" : "dungeon settings",
	"desc" : "A deep hole full of dark horrors. Many see groutesque monstrosites emerge from their hive.",
	"building effects" : [],
	"cost" : [],
	"show" : [],
	"available buildings" : ["gilded pit"],
	"available tiles" : [],
	"model" : "res://resources/Models/Dark Pit.glb"
},
{
	"name" : "Dark Portal",
	"category" : "dark structure",
	"settings" : "dungeon settings",
	"desc" : "A ancient structure linking the plane of Doamos to some twisted reality. The glow draws in it's prey.",
	"building effects" : [],
	"cost" : [],
	"show" : [],
	"available buildings" : ["gilded portal"],
	"available tiles" : [],
	"model" : "res://resources/Models/Dark Portal.glb"
},
{
	
	"name" : "Dark Castle",
	"category" : "dark structure",
	"settings" : "dungeon settings",
	"desc" : "A bastion of an evil long since reawaken. Many hear maniacal laughter from within the hold.",
	"building effects" : [],
	"cost" : [],
	"show" : [],
	"available buildings" : ["gilded castle"],
	"available tiles" : [],
	"model" : "res://resources/Models/Dark Castle.glb"
},
#################
# Dark Dungeons #
#################
####################
# Gilded Structure #
####################
{
	"name" : "Gilded Tower",
	"category" : "gilded structure",
	"settings" : "gilded settings",
	"desc" : "A watch tower fit for a high wizard.",
	"building effects" : [["conquer", 1]],
	"cost" : [],
	"show" : [["level", 4]],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Gilded_dungeons/Gilded_Tower.glb"
},
{
	"name" : "Gilded Fortress",
	"category" : "gilded structure",
	"settings" : "gilded settings",
	"desc" : "A Barrack for to train elite.",
	"building effects" : [["conquer", 1]],
	"cost" : [],
	"show" : [["level", 4]],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Gilded_dungeons/Gilded_Fortress.glb"
},
{
	"name" : "Gilded Pit",
	"category" : "gilded structure",
	"settings" : "gilded settings",
	"desc" : "A deep hole full of ores unkown to man.",
	"building effects" : [["conquer", 1]],
	"cost" : [],
	"show" : [["level", 4]],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Gilded_dungeons/Gilded_Pit.glb"
},
{
	"name" : "Gilded Portal",
	"category" : "gilded structure",
	"settings" : "gilded settings",
	"desc" : "A worm whole to a pocket demension for stroage.",
	"building effects" : [["conquer", 1]],
	"cost" : [],
	"show" : [["level", 4]],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Gilded_dungeons/Gilded_Portal.glb"
},
{
	"name" : "Gilded Castle",
	"category" : "gilded structure",
	"settings" : "gilded settings",
	"desc" : "A bastion of trade. May thee be conenctd with the world",
	"building effects" : [["conquer", 1]],
	"cost" : [],
	"show" : [["level", 4]],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Gilded_dungeons/Gilded_Castle.glb"
},
####################
# Gilded Structure #
####################
################
# Player built #
################
{
	"name" : "Town Center",
	"category" : "center",
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
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Buildings/center.glb"
},
{
	"name" : "House",
	"category" : "storage",
	"settings" : "house settings",
	"desc" : "A building that increases the population cap of your settlment",
	"building effects" : [["population cap", 2], ["population", 2]],
	"cost" : [["wood", 1]],
	"show" : [],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/House.glb"
},
{
	"name" : "Warehouse",
	"category" : "storage",
	"settings" : "warehouse settings",
	"desc" : "A building that store a lot of different resources",
	"building effects" : [["wood cap", 2], ["money cap", 2], ["food cap", 2], ["mineral cap", 2]],
	"cost" : [["wood", 2]],
	"show" : [],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Buildings/Warehouse.glb"
},
{
	"name" : "Vault",
	"category" : "production",
	"settings" : "vault settings",
	"desc" : "Store you precous gold here.",
	"building effects" : [["money cap", 4]],
	"cost" : [["wood", 1], ["minerals", 1]],
	"show" : [],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Buildings/Vault.glb"
},
{
	"name" : "Lumber Yard",
	"category" : "storage",
	"settings" : "lumber yard settings",
	"desc" : "A peice of land used to store lumber",
	"building effects" : [["wood cap", 4]],
	"cost" : [["wood", 2]],
	"show" : [],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Buildings/Woodyard.glb"
},
{
	"name" : "Lumber Mill",
	"category" : "production",
	"settings" : "lumber mill settings",
	"desc" : "Cut down trees to gain wood to contruct grand buildings",
	"building effects" : [],
	"cost" : [["wood", 1]],
	"show" : [],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Lumber mill.glb"
},
{
	"name" : "Larder",
	"category" : "storage",
	"settings" : "larder settings",
	"desc" : "A place to store food",
	"building effects" : [["food cap", 4]],
	"cost" : [["wood", 2]],
	"show" : [],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Buildings/Tradecenter.glb"
},
{
	"name" : "Fishery",
	"category" : "production",
	"settings" : "fishery settings",
	"desc" : "A dock to catch the life of the sea.",
	"building effects" : [],
	"cost" : [["wood", 1]],
	"show" : [],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Fishery.glb"
},
{
	"name" : "Stone yard",
	"category" : "storage",
	"settings" : "stone yard settings",
	"desc" : "A place to put all of those stones and minerals at.",
	"building effects" : [["mineral cap", 4]],
	"cost" : [["minerals", 2]],
	"show" : [],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Buildings/Stoneyard.glb"
},
{
	"name" : "Mine",
	"category" : "production",
	"settings" : "mine settings",
	"building effects" : [],
	"desc" : "",
	"cost" : [["minerals", 1]],
	"show" : [],
	"available buildings" : [],
	"available tiles" : [],
	"model" : "res://resources/Models/Mine.glb"
}
################
# Player built #
################
]
