@tool
extends AbstractStatBind
class_name StatBind

@export var stats_manager: StatsManager:
	set(value):
		stats_manager = value
		notify_property_list_changed()

func get_stats_manager() -> StatsManager:
	return stats_manager