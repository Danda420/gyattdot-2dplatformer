extends Area2D

@onready var animated_sprite_2d = %AnimatedSprite2D

func _ready():
	animated_sprite_2d.play("default")
	
func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		queue_free()
		ScoreManager.add_score_permen1()
