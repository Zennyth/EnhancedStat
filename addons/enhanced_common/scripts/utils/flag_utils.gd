extends Object
class_name FlagUtils


static func is_bit_enabled(mask: int, index: int) -> bool:
	if index < 0:
		return false

	return mask & (1 << index) != 0

static func enable_bit(mask: int, index: int) -> int:
	if index < 0:
		return mask

	return mask | (1 << index)

static func disable_bit(mask: int, index: int) -> int:
	return mask & ~(1 << index)
