extends Area2D

func _ready() -> void:
	position = Vector2(0, 400)

func _process(delta: float) -> void:
	position.x = get_global_mouse_position().x
	if get_global_mouse_position().y >= 400:
		position.y = get_global_mouse_position().y
