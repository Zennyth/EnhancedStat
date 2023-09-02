extends EnhancedEditorInspectorPlugin

const StatBindKeyButton = preload("res://addons/enhanced_stat/scenes/editor/stats/bind/StatBindKeyButton.tscn")
const StatBindPropertyButton = preload("res://addons/enhanced_stat/scenes/editor/stats/bind/StatBindPropertyButton.tscn")

func _can_handle(object: Object) -> bool:
	return object is AbstractStatBind


func _parse_property(object: Object, type: Variant.Type, name: String, hint_type: PropertyHint, hint_string: String, usage_flags: int, wide: bool) -> bool:
	if name == "stat_key":
		var button = StatBindKeyButton.instantiate()
		button.initialize(object)
		add_custom_editor_inspector_container("Stat", button)
		return true
	
	if name == "property_to_bind":
		var button = StatBindPropertyButton.instantiate()
		button.initialize(object)
		add_custom_editor_inspector_container("Property to bind", button)
		return true
	
	return false