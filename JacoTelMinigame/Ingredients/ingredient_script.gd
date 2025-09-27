extends Area2D
@export var speed = 500

func _process(delta: float) -> void:
	position.y += (speed*delta)
	
func area_entered(area: Area2D) -> void:
	queue_free()
