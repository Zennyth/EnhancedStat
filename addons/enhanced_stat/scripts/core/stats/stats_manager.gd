@tool
@icon("res://addons/enhanced_stat/icons/icons8-stats-24 (1).png")
extends Node
class_name StatsManager
## The StatsManager class provides an interface to manage Stats and is typically attached to the entity that owns those stats. 
## This makes it easier to access and manipulate stats during gameplay.

## Stats holder
var stats: Stats:
	set = set_stats

func set_stats(value) -> void:
	stats = value
	initialize_replication()

## Get a specific stat by it's key
func get_stat(key: Variant) -> Stat:
	return stats.get_stat(key) if stats != null else null



###
# STAT MODIFIERS
###

## Add a stat modifier to a stat
func add_stat_modifier(stat_modifier: StatModifier) -> void:
	if stats == null:
		return

	stats.add_stat_modifier(stat_modifier)

## Remove a stat modifier from a stat
func remove_stat_modifier(stat_modifier: StatModifier) -> void:
	if stats == null:
		return

	stats.remove_stat_modifier(stat_modifier)

## Clear all stat modifiers from all stats
func clear_stat_modifiers() -> void:
	if stats == null:
		return

	stats.clear_stat_modifiers()


###
# MULTIPLAYER (Experimental)
# TODO: Make this a component to attach to a StatsManager
###
func _ready() -> void:
	if !is_multiplayer_authority():
		return

	initialize_replication()

var is_replication_enabled: bool = false

## Initialize the replication of all stats to all peers
func initialize_replication() -> void:
	if Engine.is_editor_hint():
		return

	if is_replication_enabled == true or !is_node_ready():
		return
	
	if stats == null:
		return
	
	for stat_key in stats.map.keys():
		stats.get_stat(stat_key).value_changed.connect(_on_stat_value_changed.bind(stat_key, stats.get_stat(stat_key)))
	
	is_replication_enabled = true

func _on_stat_value_changed(key: GDScript, stat: Stat) -> void:
	sync_stat.rpc(key.resource_path, stat.value)

## Sync the stat value of a specific stat by it's key and it's current value
@rpc("call_local", "any_peer")
func sync_stat(key_path, value) -> void:
	var key: GDScript = load(key_path)
	var stat: Stat = get_stat(key)

	if stat:
		stat.value = value
