extends Node2D

const ingredient = preload("res://JacoTelMinigame/Ingredients/ingredient.tscn")
var seconds_elapsed = 0

func _process(delta: float) -> void:
	seconds_elapsed += delta
	if seconds_elapsed >= 0.5:
		var ingredient_amount = randi_range(1, 2)
		for ingred in ingredient_amount:
			var i = ingredient.instantiate()
			i.position.x = randf_range(0, 1152)
			self.add_child(i)
		seconds_elapsed = 0
