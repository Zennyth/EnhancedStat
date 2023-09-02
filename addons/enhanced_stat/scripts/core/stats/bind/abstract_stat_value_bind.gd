@tool
@icon("res://addons/enhanced_common/icons/icons8-stats-24.png")
extends AbstractStatBind
class_name AbstractStatValueBind

func bind() -> void:
	if target == null or property_to_bind == "":
		return push_error("Target has not been configured properly.")
	
	if stat_key == null or _stats_manager == null:
		return push_error("Stat has not been configured properly.")
	
	_stat = _stats_manager.get_stat(stat_key)

	if _stat == null:
		return
	
	_stat.value_changed.connect(_on_value_changed)
	_on_value_changed()

func _on_value_changed() -> void:
	target.set(property_to_bind, _stat.value)
	

func unbind() -> void:
	if _stat == null:
		return push_warning("Can't unbind null _stat.")
	
	_stat.value_changed.disconnect(_on_value_changed)
