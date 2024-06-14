extends Node

@onready var score_label = %Score

func _ready():
	update_score()
	GameManager.connect("score_changed", Callable(self, "update_score"))

func update_score():
	score_label.text = "Score: " + str(GameManager.get_score())
