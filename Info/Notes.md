# Notes

## 5/6/2023

Still fixing things and it's fucking awful, I just need to make the new change button update it's name on it's own, and add functionality to the show and buy functions. fter that I need to update teh title screen .

## 5/5/2023

Everything got broken...
Im going to salvage as much as possible

## list of broken things

Readme.txt
game screen all script and scene
All of TileData is broken
All of Change Button is broken
All of the Category list is broken

## 5/4/2023

I need to make the chagne button more legible
Add something that happens when the dungeon is completed
Add an end
I need to allow the player to view what can be built on tiles

## 4/30/2023

friday 5 new kittens where added to the litter and mom cat doesn't want to 
bother with them.

I need to add a few more functions to buildings notably the  ability for 
buildings upon contruction to be able to add to resource and resource caps

Then I need to fix the issue where the player can change the amount working on a
job even if the job is in session

To make this game more like a game I want to added several new builds that 
expand what the player can do in the game I.E. storage and ecruing money.

## 4/28/2023

This isgetting stressfull. I need a way to get job data into the tile so that
the player can get resources.

Types of builds

	Dungeon - Workers sent here have a chance to die if not properly prepared.
	Storage - Max cap for materials are increased when created.
	Production - Workers sent here can gain resources

the issue is with both Dungeons and Production buildings but right now just
Production.

Job info

	job name
	job description
	job in session - is the job being worked on.
	Job on repeat - is the job going to keep going.
	number of workers
	worker cap
	time - how long will it take to finish the job.
	rewards - what is given when the job is done

I need a way to store this data effectivly so that it can easily be changed so
I might have to make 


## 4/26/2023

Now that the player can build things, I need a way to have the player assign 
people to builds to get
resources.

To do this I need a way to assign what type of building something is.

storage changers
---
House - + 1 to population cap

Resource gathers
---
Lumber mill + 1 to wood
Mine + 1 to minerals
Fishery + 1 to food

The dungeons will give differing amounts of random things so that can be worked
on later

So each building can house up to 2 people with the only exception being Dungeons
which can have 4. The buildings then go into a producing mode which will take 
defualt time / workers. then once done producing materials, the works will go 
back and work

so building types will be
Producers
Storage
Dungeon


## 4/25/2023

Progress will now speed up fast as the tile manager is now up and running. 
The next thing to do is to get population and fucntionality with the buildings.


## 4/23/2023

I didn't do anything in this game at all because I was working on another 3D 
model that looks awesome. For that model I just need to make an arm with several
different hands to get it ready. Forthis game I need to create several new 
buildings to allow myself to create the ui.To make this easy I need to add a 
description for both tiles and buildings.

## 4/22/2023

I couldn't do anything today as I'm stuck using this laptop and this danm thing
can't open Godot nor even play simple games like Quake.
So all I did today was make a 3D model for another thing I'm working on.

though I can make some of the buildings I want to add into the game.

1. House
2. Lumbermill
3. Mine
4. Fishery

## 4/21/2023

I have no idea why I can't update my logs at a timely manner at all nor it,
why... no I know why.

Anyways OI'm trying to get buildings to work in the game but first is to try to
get them to display via a file called tile creator which will clean up the tile
script and allow for a free form of scripting. After getting buildings to appear
I wan to allow the user to spend money to build sctructures which would also in
tale adding money into the game which I would need to get what the user selected
and then 

## 4/20/2023

I'm trying to get buildings into the game so that I can add money to the game 
but I need to create building models
