extends Node2D

const ingredient = preload("res://JacoTelMinigame/Ingredients/ingredient.tscn")
var seconds_elapsed = 0
var desired_ingredients = []
var mistakes = 0
var prev_rand_number = -1

@export var receipt: Control
@export var mistake_counter: Control
@export var timer: Control
@export var ingredients_list = [
	["Lettuce", Color(0, 1, 0.25, 1)], 
	["Meat", Color(1, 0, 0.25, 1)],
	["Cheese", Color(1, 1, 0.25, 1)]
]

func _ready() -> void:
	var rand_ingred = 0
	for ingred in 3:
		rand_ingred = randi_range(0,ingredients_list.size()-1)
		desired_ingredients.append(ingredients_list[rand_ingred][0])
	update_receipt()
	update_mistakes()

func _process(delta: float) -> void:
	seconds_elapsed += delta
	if seconds_elapsed >= 0.5:
		var ingredient_amount = randi_range(1, 1)
		for ingred in ingredient_amount:
			spawn_ingredient()
		seconds_elapsed = 0

func spawn_ingredient(): #Spawns ingredient and randomizes stats
	var i = ingredient.instantiate()
	
	var rand_ingred = randi_range(0,ingredients_list.size()-1)
	while prev_rand_number == rand_ingred:
		rand_ingred = randi_range(0,ingredients_list.size()-1)
	prev_rand_number = rand_ingred
		
	i.assigned_ingredient = ingredients_list[rand_ingred][0]
	i.get_node("Icon").modulate = ingredients_list[rand_ingred][1]
	i.position.x = randf_range(0, 1152)
	i.player_collision.connect(ingredient_player_collision)
	self.add_child(i)
	
func ingredient_player_collision(ingred):
	if (desired_ingredients != []) && (ingred == desired_ingredients[0]):
		desired_ingredients.remove_at(0)
		update_receipt()
		if (desired_ingredients == []):
			timer.task_completed = true
	else: 
		mistakes += 1
		update_mistakes()
		if mistakes >= 3:
			print("RES")
			SignalBus.emit_signal("transition", "res://JacoTelMinigame/0Manager/jaco_tel_minigame.tscn")

func update_receipt():
	receipt.text = "\n".join(desired_ingredients)

func update_mistakes():
	mistake_counter.text = ""
	for mis in mistakes:
		mistake_counter.text += "X"
	
