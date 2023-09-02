extends Resource

var target: Node2D:
	set = set_target

func set_target(value) -> void:
	target = value

func _enable() -> void:
	pass

func _disable() -> void:
	pass

func _tick() -> void:
	pass

func get_intensity() -> float:
	return 0.


func get_target_component(component_class):
	return NodeUtils.find_node(target, component_class)

func get_target_stat(stat_class):
	return NodeUtils.find_node(target, StatsManager).get_stat(stat_class)
