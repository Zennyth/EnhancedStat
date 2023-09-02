extends HitboxComponent
class_name ImpactHitboxComponent

@export var damage: int = 1
@export var knockback_force: int = 150
@export var hurt_duration: float = .1
@export var hurt_intensity: float = 10.

func _hit_hurtbox(hutbox: Hurtbox) -> void:
	var hit_data: HitData = HitData.new(knockback_force, (hutbox.global_position - global_position).normalized(), owner, damage)
	hutbox.hurt.rpc(hit_data.to_dictionary())