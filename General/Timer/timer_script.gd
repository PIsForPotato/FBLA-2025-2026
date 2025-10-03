extends Control
@export var max_time = 15
@onready var bar = $TextureProgressBar
var task_completed = false

func _ready():
	bar.max_value = max_time
	bar.value = max_time
	begin_countdown()
	
func begin_countdown():
	while bar.value > 0:
		await get_tree().create_timer(1.0).timeout
		bar.value -= 1
	if task_completed:
		SignalBus.emit_signal("winning_popup", "JacoTel")
	else:
		SignalBus.emit_signal("transition", "res://JacoTelMinigame/0Manager/jaco_tel_minigame.tscn")
