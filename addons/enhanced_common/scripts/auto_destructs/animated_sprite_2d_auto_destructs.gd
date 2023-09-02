extends AnimatedSprite2D
class_name AnimatedSprite2DAutoDestructs

func _ready() -> void:
	animation_finished.connect(destroy, CONNECT_ONE_SHOT)

func destroy() -> void:
	_destroy()
	queue_free()

func _destroy() -> void:
	pass