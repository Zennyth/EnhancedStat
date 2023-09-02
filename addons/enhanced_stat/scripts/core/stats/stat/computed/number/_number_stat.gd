extends ComputedStat
class_name NumberStat

signal increased(value, amount)
signal decreased(value, amount)
	
func compute() -> void:
	var previous = _value
	
	super()

	if previous == null:
		return
	
	var amount = _value - previous

	if amount > 0:
		increased.emit(value, amount)
	elif amount < 0:
		decreased.emit(value, amount)
