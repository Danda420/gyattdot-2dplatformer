extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
@export var target_level : PackedScene
func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		call_deferred("change_scene")

func change_scene():
	if target_level == null:
		print("Target level is null, please set the target_level")
		return
		
	get_tree().change_scene_to_packed(target_level)
