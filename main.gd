extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

@export var target_level : PackedScene

func _on_button_pressed():
	get_tree().change_scene_to_packed(target_level)
