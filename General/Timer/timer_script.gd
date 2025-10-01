extends Control
@export var max_time = 15
@onready var bar = $TextureProgressBar

func _ready():
	bar.max_value = max_time
	bar.value = max_time
	begin_countdown()
	
func begin_countdown():
	while bar.value > 0:
		await get_tree().create_timer(1.0).timeout
		bar.value -= 1
	SignalBus.emit_signal("transition", "res://JacoTelMinigame/0Manager/jaco_tel_minigame.tscn")
