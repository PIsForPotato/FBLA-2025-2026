extends Area2D

func _ready() -> void:
	position = Vector2(0, 500)

func _process(delta: float) -> void:
	position.x = get_global_mouse_position().x
	if get_global_mouse_position().y >= 500:
		position.y = get_global_mouse_position().y
