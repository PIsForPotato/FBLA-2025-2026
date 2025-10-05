extends CanvasLayer

@onready var main = get_parent()
@onready var scene_holder = main.get_node("SceneHolder")
const popup = preload("res://General/WinningPopup/winning_popup.tscn")
var scene: String

func _ready() -> void:
	$ColorRect.visible = false
	SignalBus.transition.connect(transition)
	SignalBus.winning_popup.connect(winning_popup)

#Start the transition animation
func transition(recieved_scene: String):
	scene = recieved_scene
	$AnimationPlayer.play("fade_in")
	$ColorRect.visible = true

#Spawn the winning popup
func winning_popup(minigame_key: String, mistakes: int):
	get_tree().paused = true
	var p = popup.instantiate()
	p.mistakes = mistakes
	self.add_child(p)

#Transitions fade in to fade out to invisible
func anim_finished(anim_name: StringName) -> void:
	if anim_name == "fade_in":
		$AnimationPlayer.play("fade_out")
		switch_scene()
	if anim_name == "fade_out":
		$ColorRect.visible = false

#Switching scenes, deleting the old one
func switch_scene():
	main.get_child(0).get_child(0).queue_free()
	main.get_child(0).add_child(load(scene).instantiate())
	get_tree().paused = false
	if get_node("WinningPopup") != null:
		get_node("WinningPopup").queue_free()
