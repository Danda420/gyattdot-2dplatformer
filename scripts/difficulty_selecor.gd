extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_difficulty_1_pressed():
	GameManager.set_health(5)
	get_tree().change_scene_to_file("res://lvl1.tscn")


func _on_difficulty_2_pressed():
	GameManager.set_health(3)
	get_tree().change_scene_to_file("res://lvl1.tscn")
