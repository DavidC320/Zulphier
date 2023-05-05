# To do List

## 5/4/2023

1. Figure out why the game won't take away an amount from the rescources.
	if it does then what is in place to check if the rescorece is available
	
2. Add hints into the game.
	a. Hide all ui elements in the game until they are needed
		b. the tile data ui is hidden until the player clicks a tile
		c. the resource ui is hidden until the player changes a resource
	b. text will appear at first to guide the player
		a. the game will ask the player to find a spot for their center
		b. the game will ask the player to build a lumber mill
		c. the game will ask the player to build a lumber yard
		d. the game will ask the player to build a road
		
3. create the map parameters menu into the game.
4. create a pause menu into the game.

5. create the models for the new buildings
	a. Town center
	b. Warehouse
	c. Wood Yard
	d. Larder
	e. Stone yard

## 5/3/2023
1. Add hints into the game
	a. When the game starts, have a text that tells the player to create a town
		center.
2. Add a menu that changes the map
3. Add new building, Trade center
4. Add the town center // Done
5. Make it where tiles check if their ajacent to connection I.E. Roads and docks // Dones
	The game will allow the player to make changes to them
6. available requirments to the game that will only show the item if certain // Done
	conditions are met


## 5/1/2023
1. Have the building overide available tiles and buildings
2. create a title screen
3. create a check for connection which is if a tile is near a road then the
	then the player can interact with the tiles
3. create buildings
	a. Town center
	b. trade center
4. fix the bug where the player can infinitly add more to the cap by repeatly 
	building storage as the previous storage would not be subracted from the caps


## 4/29/2023
1. give buildings a creation affect that allow the house to add population and
population cap ---
2. Have the tile ui's building and tile change ui overrided by the current 
building allowing for possible upgrades though mostly to stop the player from
converting buildings and changing the tile into an illigl tile
3. create a title screen
4. create new buildings
	a. Lumber yard - storage for lumber +4 to wood cap ---
	b. Larder - storage for food +4 to food cap ---
	c. stone yard - storage for minerals +4 to mineral cap ---
	d. town center - gives the player starting resources - +4 to population and +6 to others
	e. Warehouse - storage for all resources except for population +2 to each ---
	f. vault - storage for money +4 to money cap ---
	h. trade center - place where resources except for population can be sold - needs to be looked at

## 4/26/2023

All of 4/45/2023
1. seperate the tile viewer from the scroll box
2. Create checks for tiles such so that the player can't just create anything any where
3. remove the function to change buildings if thier is already a building present

## 4/25/2023

1. add funality to buildings
	a. create a ui for the building interface
2. create a population for the player to control
	a. for now, the population grows when houses are built

## 4/22/2023

1. allow the player to add buildings into the world
	a. display possible buildings and current building in the tile data bar.
	b. Implement money into the game


## 4/19/2023

1. create a tile genration handler node that will deal with all tile functions
2. add buildings to the game
3. impliment money to the game
4. allow the player to add buildings to tiles
