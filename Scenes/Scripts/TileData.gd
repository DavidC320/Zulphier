var tile_list = [
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

var perlin_gnerate_tile_list = [ #-1 - 1
	[-0.1, "water"],
	[0.0, "sand"],
	[0.1, "grass"],
	[0.2, "forest"],
	[1.0, "mountain"]
]
