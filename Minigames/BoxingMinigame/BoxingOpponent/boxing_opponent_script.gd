extends Node2D

var attack_cycle = ["uppercut_right_charge", "jab_left", "jab_right"]
var attack_step = 0

func _ready() -> void:
	$AnimationPlayer.play(attack_cycle[attack_step])
	
func attack():
	#Change later
	get_parent().mistakes += 1
	get_parent().get_node("CameraEffects").rattle()

func transition_to_next_anim(anim_key: String):
	$AnimationPlayer.play(anim_key)

func attack_anim_done():
	attack_step += 1
	if attack_step > (attack_cycle.size()-1):
		attack_step = 0
	$AnimationPlayer.play(attack_cycle[attack_step])
	
