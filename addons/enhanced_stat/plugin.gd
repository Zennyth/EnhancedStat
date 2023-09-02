@tool
extends EditorPlugin


const StatModifierEditorInspector = preload("res://addons/enhanced_stat/scripts/editor/stats/modifiers/stat_modifier_editor.gd")
var stat_modifier_editor_inspector: StatModifierEditorInspector

const StatBindEditorInspector = preload("res://addons/enhanced_stat/scripts/editor/stats/bind/stat_bind_editor.gd")
var stat_bind_editor_inspector: StatBindEditorInspector

const StatListenerEditorInspector = preload("res://addons/enhanced_stat/scripts/editor/stats/listeners/stat_listener_editor.gd")
var stat_listener_editor_inspector: StatListenerEditorInspector

func _enter_tree():
	stat_modifier_editor_inspector = StatModifierEditorInspector.new()
	add_inspector_plugin(stat_modifier_editor_inspector)
	
	stat_bind_editor_inspector = StatBindEditorInspector.new()
	add_inspector_plugin(stat_bind_editor_inspector)

	stat_listener_editor_inspector = StatListenerEditorInspector.new()
	add_inspector_plugin(stat_listener_editor_inspector)

func _exit_tree():
	remove_inspector_plugin(stat_modifier_editor_inspector)
	remove_inspector_plugin(stat_bind_editor_inspector)
	remove_inspector_plugin(stat_listener_editor_inspector)