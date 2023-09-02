extends Object
class_name SignalUtils


static func disconnect_if_connected(_signal: Signal, _callable: Callable) -> void:
    if _callable.is_valid() and _signal.is_connected(_callable):
        _signal.disconnect(_callable)

static func connect_if_not_connected(_signal: Signal, _callable: Callable) -> void:
    if not _callable.is_valid() or _signal.is_connected(_callable):
        return
    
    _signal.connect(_callable)