extends Node2D

#Universal Variables
@export var minigame_key: String
@export var timer: Control
@export var mistake_counter: Control
var mistakes = 0

func update_mistakes():
	mistake_counter.text = ""
	for mis in mistakes:
		mistake_counter.text += "X"
	
