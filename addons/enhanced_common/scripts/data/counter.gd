extends RefCounted
class_name IntCounter


class Interval extends RefCounted:
	var amount: int
	var callback: Callable

	func _init(_amount: int, _callback: Callable) -> void:
		amount = _amount
		callback = _callback


var _value: int:
	set = set_value

func set_value(new_value) -> void:
	var previous = _value
	_value = new_value

	if new_value < previous:
		return

	for interval in _intervals.values():
		if new_value % interval.amount != 0:
			continue
		
		interval.callback.call()

func count_up(count) -> void:
	_value += count

	if _value >= _max_interval_amount:
		_value -= _max_interval_amount


var _max_interval_amount: int = 1
var _intervals: Dictionary = {}

func register_interval(interval: Interval) -> void:
	_intervals[interval] = interval

	if interval.amount > _max_interval_amount:
		_max_interval_amount = interval.amount

func remove_interval(interval: Interval) -> void:
	if !_intervals.has(interval):
		return
	
	_intervals.erase(interval)

	_max_interval_amount = 0
	for _interval in _intervals.values():
		if _interval.amount > _max_interval_amount:
			_max_interval_amount = _interval.amount