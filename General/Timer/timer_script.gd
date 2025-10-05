extends Control
@export var max_time = 15
@export var minigame: Node
@onready var bar = $TextureProgressBar
var task_completed = false

#Set up and start at max time value
func _ready():
	bar.max_value = max_time
	bar.value = max_time
	begin_countdown()
	
#Timer starts ticking! Survive until task completion 
func begin_countdown():
	while bar.value > 0:
		await get_tree().create_timer(1.0).timeout
		bar.value -= 1
	if task_completed:
		SignalBus.emit_signal("winning_popup", minigame.minigame_key, minigame.mistakes)
	else:
		SignalBus.emit_signal("transition", "res://Minigames/JacoTelMinigame/0Manager/jaco_tel_minigame.tscn")
