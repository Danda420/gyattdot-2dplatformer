extends Node2D

@onready var scorelabel = %Label

var score = ScoreManager.get_score()

# Called when the node enters the scene tree for the first time.
func _ready():
	scorelabel.text = "Score: " + str(score)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	ScoreManager.reset_score()

