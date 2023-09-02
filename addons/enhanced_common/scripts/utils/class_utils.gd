@tool
extends Node
# ClassUtils

var custom_classes: Dictionary = {}
var custom_classes_by_path: Dictionary = {}
var custom_class_tree: Dictionary = {}


func _ready() -> void:
	for custom_class in ProjectSettings.get_global_class_list():
		if !FileAccess.file_exists(custom_class.path):
			continue
		
		custom_classes[custom_class.class] = custom_class
		custom_classes_by_path[custom_class.path] = custom_class

		if custom_class_tree.has(custom_class.base):
			custom_class_tree[custom_class.base].append(custom_class.class)
		else:
			custom_class_tree[custom_class.base] = [custom_class.class]





func get_classes() -> Array:
	return custom_classes.values()

func get_inheriters_from_class(_name: String) -> Array:
	if !custom_class_tree.has(_name):
		return [custom_classes[_name]]
		
	var classes: Array = []

	for custom_class_name in custom_class_tree[_name]:
		classes += get_inheriters_from_class(custom_class_name)
	
	return classes
	
func get_custom_class(object: Object) -> Dictionary:
	return custom_classes_by_path[object.get_script().resource_path]

func get_custom_class_by_name(custom_class_name: String) -> Dictionary:
	return custom_classes[custom_class_name]
		
func get_custom_classes_from_exported_properties(object) -> Array:
	if object.has_method("_get_property_list"):
		return object._get_property_list().filter(func(p: Dictionary): return p.usage == 4102)

	return object.get_property_list().filter(func(p: Dictionary): return p.usage == 4102)

func get_custom_classes_from_custom_class(custom_class_name: String) -> Array:
	return get_custom_classes_from_exported_properties(load(get_custom_class_by_name(custom_class_name).path).new()).map(func(p: Dictionary): return get_custom_class_by_name(p.hint_string))

