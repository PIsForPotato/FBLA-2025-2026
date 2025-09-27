extends Area2D
@export var speed = 500

var ingredients_list = [
	["Lettuce", Color(0, 1, 0.25, 1)], 
	["Meat", Color(1, 0, 0.25, 1)],
	["Cheese", Color(1, 1, 0.25, 1)]
]

var assigned_ingredient

func _ready() -> void:
	speed += randf_range(-100, 100)
	var rand_ingred = randi_range(0,ingredients_list.size()-1)
	assigned_ingredient = ingredients_list[rand_ingred][0]
	$Icon.modulate = ingredients_list[rand_ingred][1]
	
func _process(delta: float) -> void:
	position.y += (speed*delta)
	
func area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		queue_free()
