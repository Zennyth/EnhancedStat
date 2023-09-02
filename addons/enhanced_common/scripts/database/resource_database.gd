extends Resource
class_name ResourceDatabase

var _resources: Array[Resource] = []

func _add_entry(resource: Resource) -> void:
	if _resources.has(resource):
		return

	_resources.append(resource)

func _remove_entry(resource: Resource) -> void:
	if !_resources.has(resource):
		return
	
	_resources.erase(resource)

func _get_resouces() -> Array[Resource]:
	return _resources