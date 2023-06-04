# Requirement list

## Array Checks

---
## Building_over_level | building data needed | ["building_over_level", Int]

check : building_level >= requirement_level

## building_is_level | building data needed | ["building_of_level", Int]

check : building_level == requirement_level

---

## String checks

---

## Only_building | map data needed | "only_building"

check : if building_name not in map

## Anywhere | Map data needed | "anywhere"

Check : if not connected - true

## connection | Map data needed | "connection

check : if adjacent tiles is [list of connection tiles] then true
