extends HitboxComponent
class_name VfxHitboxComponent

enum HitboxInteraction {
    ALL,
    BODY,
    HURTBOX
}

@export var packed_vfx: PackedScene
@export var interaction: HitboxInteraction = HitboxInteraction.ALL

var vfx: Node2D


func instantiate_vfx(target: Node2D) -> void:
    vfx = packed_vfx.instantiate()
    vfx.global_position = target.global_position
    vfx.top_level = true
    target.call_deferred("add_child", vfx)


func _hit_hurtbox(hutbox: Hurtbox) -> void:
    if interaction != HitboxInteraction.HURTBOX:
        return

    instantiate_vfx(hutbox)

func _hit_body(body: Node2D) -> void:
    if interaction != HitboxInteraction.BODY:
        return

    instantiate_vfx(body)

func _on_hit(hitted: Node2D) -> void:
    if interaction != HitboxInteraction.ALL:
        return

    instantiate_vfx(hitted)
