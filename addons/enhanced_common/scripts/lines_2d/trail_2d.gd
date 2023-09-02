extends Line2D
class_name Trail2D

signal _enabled
signal _disabled


var is_enabled: bool = false

func _ready() -> void:
	enable()
	
func enable() -> void:
	is_enabled = true
	_enabled.emit()
	top_level = true
	position_offset = position

	NodeUtils.enable_node(self, true)

func disable() -> void:
	is_enabled = false
	_disabled.emit()

	if get_point_count() < 0:
		NodeUtils.enable_node(self, false)



@export var length: int = 50
var point := Vector2.ZERO
var position_offset: Vector2

func _process(_delta: float) -> void:
	global_position = Vector2.ZERO + position_offset
	global_rotation = 0

	point = get_parent().global_position

	if is_enabled:
		add_point(point)
		
		while get_point_count() > length:
			remove_point(0)
	else:
		if get_point_count() > 0:
			remove_point(0)
		else:
			NodeUtils.enable_node(self, false)