@tool
extends MarginContainer
class_name EditorInspectorContainer

@onready var container: Container = $VBoxContainer
@onready var label: Label = $VBoxContainer/Label

var text: String
var child: Control


func initialize(_text: String, _child: Control) -> void:
	text = _text
	child = _child

func _ready() -> void:
	if child == null or text == null:
		return

	label.text = text
	child.set("size_flags_horizontal", 3)
	container.add_child(child)