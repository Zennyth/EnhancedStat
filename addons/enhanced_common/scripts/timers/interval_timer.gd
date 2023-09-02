@icon("res://addons/enhanced_common/icons/session_timeout_icon.png")
extends Timer
class_name IntervalTimer

signal _interval_finished
signal _interval_tick

@export var interval_number: int = 10
@export var rand_timer_multiplier: float = .2

func start_interval() -> void:
    _on_timeout()

func stop_interval() -> void:
    interval_number = 0

func _ready() -> void:
    one_shot = true
    timeout.connect(_on_timeout)


func _on_timeout() -> void:
    if interval_number == 0:
        _interval_finished.emit()
        return
        
    _interval_tick.emit()
    
    if interval_number > 0:
        interval_number -= 1
    
    start(randf() * rand_timer_multiplier)