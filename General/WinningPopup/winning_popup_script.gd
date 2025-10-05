extends Control

@onready var label = $Label
@onready var rank = $Rank
var mistakes = 0

func _ready() -> void:
	print(mistakes)
	match mistakes:
		0: rank.text = "A"
		1: rank.text = "B"
		2: rank.text = "C"
		_: rank.text = "?"


func _on_button_pressed() -> void:
	SignalBus.emit_signal("transition", "res://Minigames/BoxingMinigame/0Manager/boxing_minigame.tscn")
