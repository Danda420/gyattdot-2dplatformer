extends Node

@onready var score_label = %Label


func _ready():
	update_score()
	ScoreManager.connect("score_changed", Callable(self, "update_score"))

func update_score():
	score_label.text = "Score: " + str(ScoreManager.get_score())
