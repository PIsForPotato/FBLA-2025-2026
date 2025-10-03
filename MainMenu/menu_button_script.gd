extends Button

@export var scene_path: String = ""
@export var quit: bool = false

func _on_pressed() -> void:
	if quit:
		get_tree().quit()
	SignalBus.emit_signal("transition", scene_path)
