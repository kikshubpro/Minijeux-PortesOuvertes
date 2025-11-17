extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -1000.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")*4

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	velocity.x = SPEED

	move_and_slide()
	
func Explode():
	queue_free()
