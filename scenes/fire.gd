extends Area2D

@onready var animated_sprite_2d = %AnimatedSprite2D

func _ready():
	animated_sprite_2d.play("default")
	if not is_connected("body_entered", Callable(self, "_on_body_entered")):
		connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body is CharacterBody2D:
		body.respawn()
