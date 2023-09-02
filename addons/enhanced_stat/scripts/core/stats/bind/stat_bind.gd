@tool
extends AbstractStatBind
class_name StatBind

@export var stats_manager: StatsManager

func get_stats_manager() -> StatsManager:
	return stats_manager