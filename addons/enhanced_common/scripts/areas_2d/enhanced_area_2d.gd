extends Area2D
class_name EnhancedArea2D

signal node_entered(node: Node2D)
signal enhanced_area_entered(area: Area2D)
signal enhanced_body_entered(body: Node2D)


var components: Array[EnhancedArea2DComponent] = []

func register_component(component: EnhancedArea2DComponent) -> void:
	components.append(component)


func is_node_valid(node: Node2D) -> bool:
	for component in components:
		if !component.is_node_valid(node):
			return false
	
	return true

func get_overlapping_nodes() -> Array[Node2D]:
	var results: Array[Node2D] = []

	for overlapping_node in get_overlapping_areas() + get_overlapping_bodies():
		if !is_node_valid(overlapping_node):
			continue
		
		results.append(overlapping_node)
	
	return results

func get_nearest_node(target: Node2D = owner) -> Node2D:
	var nearest_node: Node2D
	var distance: float

	for node in get_overlapping_nodes():
		if target == node: 
			continue

		if nearest_node == null:
			nearest_node = node
			distance = node.global_position.distance_to(target.global_position)
		else:
			var _distance: float = node.global_position.distance_to(owner.global_position)
			if _distance < distance:
				distance = _distance
				nearest_node = node

	return nearest_node



func _init():
	area_entered.connect(_on_area_entered)
	body_entered.connect(_on_body_entered)


func _on_area_entered(area: Area2D) -> void:
	if !is_node_valid(area):
		return

	enhanced_area_entered.emit(area)
	node_entered.emit(area)

func _on_body_entered(body: Node2D) -> void:
	if !is_node_valid(body):
		return

	enhanced_body_entered.emit(body)
	node_entered.emit(body)



@onready var collision_shape = $CollisionShape2D

func disable() -> void:
	collision_shape.disabled = true

func enable() -> void:
	collision_shape.disabled = false