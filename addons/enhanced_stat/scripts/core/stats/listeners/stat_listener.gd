@icon("res://addons/enhanced_common/icons/icons8-trigger-24.png")
extends Node
class_name StatListener

signal triggered

@export var stats_manager: StatsManager
@export var stat_key: GDScript
@export var signal_name: String

func _ready() -> void:
	if stats_manager == null or stat_key == null or signal_name == null:
		return
	
	var stat: Stat = stats_manager.get_stat(stat_key)

	if stat == null or !stat.has_signal(signal_name):
		return

	stat.get(signal_name).connect(_on_triggered)

func _on_triggered(arg1 = null, arg2 = null, arg3 = null, arg4 = null) -> void:
	triggered.emit()
	

