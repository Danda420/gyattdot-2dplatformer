extends CharacterBody2D

# Constants
const SPEED = 300.0
const JUMP_VELOCITY = -450.0
const DASH_SPEED = 800.0
const DASH_DURATION = 0.2

@onready var health_label = $"/root/lvl1/Score_Health/Panel/Health"

var health = 5

func _ready():
	update_health_label()
	GameManager.connect("health_changed", Callable(self, "_on_health_changed"))
	
# Variables
@onready var sprite_2d = $Sprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dashing = false
var dash_timer = 0.0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"
	else:
		if not is_dashing:
			if velocity.x > 1 or velocity.x < -1:
				sprite_2d.animation = "running"
			else:
				sprite_2d.animation = "default"

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0:
			is_dashing = false
	else:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, 10)

		# Check for dash input
		if Input.is_action_just_pressed("dash") and not is_dashing:
			start_dash(direction)

	if is_dashing:
		velocity.x = direction * DASH_SPEED

	move_and_slide()

	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft

func start_dash(direction: float):
	if direction == 0:
		return  # Prevent dashing with no input direction
	if is_on_floor():
		sprite_2d.animation = "dash"
		is_dashing = true
		dash_timer = DASH_DURATION
		velocity.x = direction * DASH_SPEED

func die():
	GameManager.decrease_health(1)
	if GameManager.get_health() <= 0:
		game_over()
	else:
		respawn()

func respawn():
	global_position = Vector2(100, 100)

func game_over():
	get_tree().change_scene_to_file("res://game_over.tscn")

func update_health_label():
	var health_display = ""
	for i in range(GameManager.get_health()):
		health_display += "❤️"
	health_label.text = health_display

func _on_health_changed():
	update_health_label()

