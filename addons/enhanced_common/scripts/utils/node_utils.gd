extends Object
class_name NodeUtils


static func enable_node(node: Node, is_enabled: bool = true, visible: bool = false):
	node.set_process(is_enabled)
	node.set_physics_process(is_enabled)
	node.set_process_input(is_enabled)
	
	if visible and "visible" in node:
		node.visible = is_enabled
	
static func delete_children(node: Node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

static func find_nodes_by_group(node: Node, group: String, group_to_stop: String = "") -> Array[Node]:
	var descendants: Array[Node] = []
	for child in node.get_children():
		if child.is_in_group(group):
			descendants.append(child)
		
		if group_to_stop != "" and child.is_in_group(group_to_stop):
			continue
		
			descendants += find_nodes_by_group(child, group, group_to_stop)
	return descendants

static func find_nodes(node, class_to_find, class_to_stop = null) -> Array[Node]:
	var descendants: Array[Node] = []

	for child in node.get_children():
		if is_instance_of(child, class_to_find):
			descendants.append(child)
		
		if class_to_stop != null and is_instance_of(child, class_to_stop):
			continue
		
		descendants += find_nodes(child, class_to_find, class_to_stop)
	
	return descendants

static func find_node(node, class_to_find, class_to_stop = null):
	var descendant: Node = null

	for child in node.get_children():
		if is_instance_of(child, class_to_find):
			return child
		
		if class_to_stop != null and is_instance_of(child, class_to_stop):
			continue
		
		descendant = find_node(child, class_to_find, class_to_stop)

		if descendant != null:
			break
	
	return descendant

static func is_exported_property_null(node: Node, property_name: String) -> bool:
	return node.get("metadata/_editor_prop_ptr_" + property_name) == null
