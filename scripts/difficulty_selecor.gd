extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_difficulty_1_pressed():
	_start_level(1)

func _on_difficulty_2_pressed():
	_start_level(2)
	
func _start_level(difficulty: int):
	GameManager.set_health(3 if difficulty == 2 else 5)
	get_tree().change_scene_to_file("res://lvl1.tscn")
