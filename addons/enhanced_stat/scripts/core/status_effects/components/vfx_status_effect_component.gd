extends StatusEffectComponent
class_name VfxStatusEffectComponent

@export var packed_vfx: PackedScene

var vfx: Node2D

func _enable() -> void:
	vfx = packed_vfx.instantiate()
	target.add_child(vfx)

func _disable() -> void:
	if vfx == null:
		return
	
	target.remove_child(vfx)
