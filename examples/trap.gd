extends EnhancedArea2D

@onready var status_effect_applier: StatusEffectApplier = $StatusEffectApplier

func _ready() -> void:
	node_entered.connect(_on_node_entered)

func _on_node_entered(node: Node2D) -> void:
	status_effect_applier.apply(node)