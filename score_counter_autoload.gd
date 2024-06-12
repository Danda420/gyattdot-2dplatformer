extends Node

signal score_changed

var score = 0

func add_score(amount: int = 1):
	score += amount
	emit_signal("score_changed")

func get_score() -> int:
	return score

func reset_score():
	score = 0
	emit_signal("score_changed")
