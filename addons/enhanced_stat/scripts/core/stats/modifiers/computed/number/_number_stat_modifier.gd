extends ComputedStatModifier
class_name NumberStatModifier

enum Operation {
	ADD, 
	SUBSTRACT,
	MULTIPLY,
	DIVIDE
}

@export var operation: Operation = Operation.ADD

var _operation_value:
	get = get_operation_value

func get_operation_value():
	return 0

func apply(value, _stat):
	match operation:
		Operation.ADD:
			return value + (_operation_value * apply_count)
		Operation.SUBSTRACT:
			return value - (_operation_value * apply_count)
		Operation.MULTIPLY:
			return value * _operation_value * apply_count
		Operation.DIVIDE:
			if _operation_value == 0:
				push_error("NumberStatModifier cannot divide by 0")
				return value
			
			return value / _operation_value * apply_count
	
	return value