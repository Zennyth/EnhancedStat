extends GPUParticles2D
class_name OneshotGPUParticles2D

func _init() -> void:
	emitting = false
	one_shot = true


func trigger() -> void:
	restart()
	emitting = true

