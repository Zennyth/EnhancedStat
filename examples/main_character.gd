extends CharacterBody2D

@onready var _controller: Controller2D = $Controller2D
@onready var _motion: Motion2D = $Motion2D


func _ready() -> void:
	_controller.move_direction_changed.connect(_on_move_direction_changed)

func _on_move_direction_changed(direction: Vector2) -> void:
	_motion.direction = direction