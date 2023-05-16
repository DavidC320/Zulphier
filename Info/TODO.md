# Todo

## Code Cleanup

1. Separate the building data and tile data to separate files to reduce clutter

~~~
Seperating the data to different files will cause issues that will become annoying but should not take long.
~~~

2. Separate the building data from the Base tile scene to reduce clutter

~~~
The Tile will need a way to grab data from the building and change the building
~~~

3. Connect the building scene to the tile scene

4. Turn both tileData and buildingData files to preloads so that the files aren't instated every tile.

~~~
This is to fix the long load times when making a new map.
~~~

## New features

* adjacent building bonus
* structure generation
* Biomes