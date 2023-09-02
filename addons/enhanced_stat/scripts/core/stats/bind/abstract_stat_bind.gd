@tool
@icon("res://addons/enhanced_stat/icons/icons8-stats-24.png")
extends Node
class_name AbstractStatBind

@export var target: Node
@export var stat_key: GDScript
@export var property_to_bind: String


var _stat: Stat
var _stats_manager: StatsManager:
	get = get_stats_manager

func get_stats_manager() -> StatsManager:
	return null


func _ready() -> void:
	if Engine.is_editor_hint():
		return

	bind()

func bind() -> void:
	if target == null or property_to_bind == "":
		return push_error("Target has not been configured properly.")
	
	if stat_key == null or _stats_manager == null:
		return push_error("Stat has not been configured properly.")
	
	_stat = _stats_manager.get_stat(stat_key)

	if target.get(property_to_bind) == _stat:
		return
	
	target.set(property_to_bind, _stat)


func unbind() -> void:
	if _stat == null:
		return push_warning("Can't unbind null _stat.")
	
	target.set(property_to_bind, null)

