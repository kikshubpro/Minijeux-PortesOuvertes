extends CharacterBody2D

@onready var anim_sprite = $AnimatedSprite2D

const SPEED = 200

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		anim_sprite.animation = "pacman_right"
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
		anim_sprite.animation = "pacman_left"
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
		anim_sprite.animation = "pacman_down"
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		anim_sprite.animation = "pacman_up"

	direction = direction.normalized()
	velocity = direction * SPEED
	move_and_slide()
