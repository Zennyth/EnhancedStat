extends RefCounted
class_name Observable

signal value_changed(value, previous_value)

var value:
    set = set_value

func set_value(_value) -> void:
    value = _value
    value_changed.emit(_value, value)