extends Area2D
@export var speed = 500
var assigned_ingredient

signal player_collision

func _ready() -> void:
	speed += randf_range(-100, 100)
	
func _process(delta: float) -> void:
	position.y += (speed*delta)
	if position.y >= 1000:
		queue_free()
	
func area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		emit_signal("player_collision", assigned_ingredient)
		queue_free()
