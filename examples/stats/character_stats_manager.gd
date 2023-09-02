@tool
extends StatsManager
class_name CharacterStatsManager


func _ready() -> void:
	if Engine.is_editor_hint():
		return
	
	super()

func _get_property_list() -> Array:
	var result: Array = []

	result.append({ "name": "stats", "class_name": &"Resource", "type": 24, "hint": 17, "hint_string": "CharacterStats", "usage": 4102 })

	return result