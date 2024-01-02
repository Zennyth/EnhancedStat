extends EnhancedEditorInspectorPlugin


func _can_handle(object: Object) -> bool:
	return object is AbstractStatBind

func _parse_property(object: Object, type: Variant.Type, name: String, hint_type: PropertyHint, hint_string: String, usage_flags: int, wide: bool) -> bool:
	if name == "stat_key":
		var button = OptionProperties.new()
		button.initialize(object, name, _get_stats(object))
		add_custom_editor_inspector_container("Stat", button)
		return true 
	
	if name == "property_to_bind":
		var button = OptionProperties.new()
		button.initialize(object, name, _get_properties(object))
		add_custom_editor_inspector_container("Property to bind", button)
		return true
	
	return false

func _get_stats(stat_bind: AbstractStatBind) -> Array[Dictionary]:
	if stat_bind == null or stat_bind._stats_manager == null:
		return []
	
	var properties: Array[Dictionary] = []

	for property in ClassUtils.get_custom_classes_from_exported_properties(stat_bind._stats_manager).filter(func(p): return p.name == "stats"):
		for custom_class in ClassUtils.get_custom_classes_from_custom_class(property.hint_string):
			properties.append({
				"name": custom_class.class.replace("Stat", ""),
				"icon": custom_class.icon,
				"value": load(custom_class.path)
			})	
	
	return properties

func _get_properties(stat_bind: AbstractStatBind) -> Array[Dictionary]:
	if stat_bind == null or stat_bind.target == null:
		return []
	
	var properties: Array[Dictionary] = []

	for property in stat_bind.target.get_property_list().filter(func(p: Dictionary): return !p.name.contains(".gd")):
		properties.append({
			"name": property.name,
			"value": property.name
		})
		
	properties.reverse()
	return properties