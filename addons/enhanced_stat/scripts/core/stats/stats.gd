@icon("res://addons/enhanced_common/icons/icons8-stats-24 (1).png")
extends Resource
class_name Stats
## The Stats class is essentially a container for Stat objects. 
## 
## It is useful when you have an entity that has multiple stats, 
## like a character in an RPG who has health, mana, strength, etc.


###
# STATS
###

## Dictionary that holds a look up for (key, stat)
var map: Dictionary:
	get = get_map_from_list

## Generate the look up table from a list of stat
func get_map_from_list() -> Dictionary:
	var new_map = {}

	for property in get_property_list():
		# if not exported
		if property.get("usage") != 4102:
			continue

		var stat = get(property.get("name")) 

		if not stat is Stat:
			continue
		
		if stat.key in new_map:
			push_warning("Found duplicate key: ", stat.key, " in stats: ", self)
			continue

		new_map[stat.key] = stat
	
	return new_map

## Get the look up table as an array
func get_stats() -> Array:
	return map.values()

## Get a specific stat by it's key
func get_stat(key) -> Stat:
	return map[key] if key in map else null

## Check whether the key is in the look up table
func has_stat(key) -> bool:
	return map.has(key)



###
# STAT MODIFIERS
###

## Add a stat modifier to a stat
func add_stat_modifier(stat_modifier: StatModifier) -> void:
	var stat: Stat = get_stat(stat_modifier.stat_key)

	if stat == null:
		return
		
	stat.add_stat_modifier(stat_modifier)

## Remove a stat modifier from a stat
func remove_stat_modifier(stat_modifier: StatModifier) -> void:
	var stat: Stat = get_stat(stat_modifier.stat_key)

	if stat == null:
		return
		
	stat.remove_stat_modifier(stat_modifier)

## Clear all stat modifiers from all stats
func clear_stat_modifiers() -> void:
	for stat in get_stats():
		stat.clear_stat_modifiers()