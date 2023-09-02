@tool
extends AbstractStatValueBind
class_name StatValueBind

@export var stats_manager: StatsManager

func get_stats_manager() -> StatsManager:
	return stats_manager