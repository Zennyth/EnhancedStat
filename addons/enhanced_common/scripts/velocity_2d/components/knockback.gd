extends Velocity2DComponent
class_name Knockback

@export var knockback := Vector2.ZERO:
    set = set_knockback

@export var hurtbox: Hurtbox:
    set = set_hurtbox

func set_hurtbox(value) -> void:
    hurtbox = value

    if hurtbox != null:
        hurtbox._hurt.connect(_on_hurt)

func _on_hurt(hit_data: HitData) -> void:
    knockback = hit_data.knockback_direction * hit_data.knockback_force


func _physics_process(_delta: float):
    knockback = lerp(knockback, Vector2.ZERO, 0.2)

func set_knockback(value) -> void:
    knockback = value
    NodeUtils.enable_node(self, knockback.length() > 0)
    velocity.set_force(str(self), knockback)