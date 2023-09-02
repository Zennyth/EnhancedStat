@icon("res://addons/enhanced_stat/icons/pulse_icon.png")
extends "res://addons/enhanced_stat/scripts/core/status_effects/status_effect_abstract.gd"
class_name StatusEffect

signal _enabled
signal _disabled


@export var id: String

var intensity: float:
	get = get_intensity

func get_intensity() -> float:
	return 0.



var is_enabled: bool = false

@export var duration: float = 1.

var _duration: float:
	set = set_duration

func set_duration(value) -> void:
	_duration = value

	if _duration <= 0:
		disable()

func reset() -> void:
	_duration = duration


@export var tick_interval: float = 1.

var tick_clock: float = .0


@export var status_effect_components: Array[StatusEffectComponent] = []
var initial_status_effect_components: Array[StatusEffectComponent] = []


func is_target_valid(_target: Node2D) -> bool:
	return true

func set_target(value) -> void:
	if not is_target_valid(value):
		return

	target = value


func enable() -> void:
	if not is_target_valid(target):
		return

	is_enabled = true
	reset()
	_enable()
	_enabled.emit()

func disable() -> void:
	if not is_enabled:
		return
		
	is_enabled = false
	_disable()
	_disabled.emit()

func tick(delta: float) -> void:
	if not is_enabled:
		return

	_duration -= delta

	if tick_interval == 0:
		return _tick()

	if tick_interval <= -1:
		return

	tick_clock += delta

	if tick_clock < tick_interval:
		return

	tick_clock -= tick_interval
	_tick()


func _enable() -> void:
	for status_effect_component in status_effect_components:
		var initial_status_effect_component = status_effect_component.duplicate(true)
		initial_status_effect_component.target = target
		initial_status_effect_component._enable()
		initial_status_effect_components.append(initial_status_effect_component)

func _disable() -> void:
	for status_effect_component in initial_status_effect_components:
		status_effect_component._disable()

func _tick() -> void:
	for status_effect_component in initial_status_effect_components:
		status_effect_component._tick()
