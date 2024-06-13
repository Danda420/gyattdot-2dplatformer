extends Node

signal score_changed
signal health_changed

var score = 0
var health = 5

func add_score_permen1(amount: int = 10):
	score += amount
	emit_signal("score_changed")
	
func add_score_permen2(amount: int = 20):
	score += amount
	emit_signal("score_changed")

func get_score() -> int:
	return score

func reset_score():
	score = 0
	emit_signal("score_changed")

func reset_health():
	health = 5
	emit_signal("health_changed")
	
func set_health(new_health: int):
	health = new_health
	emit_signal("health_changed")

func get_health() -> int:
	return health

func decrease_health(amount: int = 1):
	health -= amount
	emit_signal("health_changed")
