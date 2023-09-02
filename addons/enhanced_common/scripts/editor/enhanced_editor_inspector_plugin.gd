extends EditorInspectorPlugin
class_name EnhancedEditorInspectorPlugin

const PackedEditorInspectorContainer = preload("res://addons/enhanced_common/scenes/editor/EditorInspectorContainer.tscn")

func add_custom_editor_inspector_container(text: String, control: Control) -> void:
	var container: EditorInspectorContainer = PackedEditorInspectorContainer.instantiate() as EditorInspectorContainer
	container.initialize(text, control)
	add_custom_control(container)