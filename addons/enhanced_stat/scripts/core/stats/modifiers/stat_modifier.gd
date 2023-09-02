extends Resource
class_name StatModifier

signal apply_count_changed()


@export var stat_key: GDScript
@export var apply_count: int = 1:
	set = set_apply_count

func set_apply_count(value: int) -> void:
	apply_count = value
	apply_count_changed.emit()


func compatible_with(stat: Stat) -> bool:
	return stat_key == stat.key