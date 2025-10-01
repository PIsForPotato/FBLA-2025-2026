extends CanvasLayer

@onready var main = get_parent()
@onready var save_manager = main.get_node("SaveManager")
var scene: String

func _ready() -> void:
	$ColorRect.visible = false
	SignalBus.connect("transition", Callable(self, "transition"))

func transition(recieved_scene: String):
	scene = recieved_scene
	$AnimationPlayer.play("fade_in")
	$ColorRect.visible = true

func anim_finished(anim_name: StringName) -> void:
	if anim_name == "fade_in":
		$AnimationPlayer.play("fade_out")
		switch_scene()
	if anim_name == "fade_out":
		$ColorRect.visible = false

func switch_scene():
	main.get_child(0).get_child(0).queue_free()
	main.get_child(0).add_child(load(scene).instantiate())
