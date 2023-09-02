@icon("res://addons/enhanced_common/icons/icons8-ookla-speedtest-24-blue.png")
extends Node
class_name Velocity2D


signal direction_changed
signal speed_changed


@export var direction   : Vector2       = Vector2.ZERO:
	set = set_direction
@export var speed       : NumberStat:
	set = set_speed    
@export var autostart   : bool          


###
# Setters
###
func set_direction(value) -> void:
	direction = value
	_on_direction_changed()

func set_speed(value) -> void:
	if speed != null:
		speed.value_changed.disconnect(_on_speed_changed)

	speed = value

	if speed != null:
		speed.value_changed.connect(_on_speed_changed)
		_on_speed_changed()


func _on_direction_changed() -> void:
	direction_changed.emit()

func _on_speed_changed() -> void:
	speed_changed.emit()

###
# Forces
###
# forces: Dictionary[String, Vector2]
var forces: Dictionary

func set_force(_id: String, _force: Vector2) -> void:
	forces[_id] = _force

func remove_force(_id: String) -> void:
	forces.erase(_id)

func get_forces() -> Array[Vector2]:
	var results: Array[Vector2] = []
	for force in forces.values():
		results.append(force as Vector2)
	return results



###
# INTERFACE
###
func move_toward_direction(move_direction: Vector2, delta: float) -> void:
	pass

###
# Enabling
###
var is_enabled: bool = false:
	set = set_is_enabled

func set_is_enabled(value) -> void:
	is_enabled = value
	NodeUtils.enable_node(self, is_enabled)

func _ready() -> void:
	is_enabled = autostart or is_enabled

func enable() -> void:
	is_enabled = true

func disable() -> void:
	is_enabled = false
	forces = {}
	direction = Vector2.ZERO
