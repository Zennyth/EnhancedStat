extends RefCounted
class_name StackData

var _stack: Array

func _init(_default_stack: Array = []) -> void:
	_stack = _default_stack

func pop() -> Variant:
	return _stack.pop_front()

func push(value: Variant) -> void:
	_stack.push_front(value)