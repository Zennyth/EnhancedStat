@tool
@icon("res://addons/enhanced_stat/icons/icons8-stats-24.png")
extends Node
class_name AbstractStatBind

enum Mode {
	BIND_STAT,
	BIND_VALUE,
}

@export var mode: Mode = Mode.BIND_STAT
@export var target: Node:
	set(value):
		target = value
		notify_property_list_changed()
@export var stat_key: GDScript
@export var property_to_bind: String


var _on_stat_value_changed
var _stats_manager: StatsManager:
	get = get_stats_manager

func get_stats_manager() -> StatsManager:
	return null


func _ready() -> void:
	if Engine.is_editor_hint():
		return

	bind()

func bind() -> void:
	if mode == Mode.BIND_STAT:
		StatUtils.bind_stat(target, property_to_bind, stat_key, _stats_manager)	
	elif mode == Mode.BIND_VALUE:
		_on_stat_value_changed = StatUtils.bind_stat_value(target, property_to_bind, stat_key, _stats_manager)

func unbind() -> void:
	if mode == Mode.BIND_STAT:
		StatUtils.unbind_stat(target, property_to_bind)	
	elif mode == Mode.BIND_VALUE:
		StatUtils.unbind_stat_value(target, property_to_bind, _on_stat_value_changed)
