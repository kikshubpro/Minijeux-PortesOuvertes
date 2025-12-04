extends CharacterBody2D

@export var speed: float = 90.0
var direction: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()

func choose_direction(possible_dirs: Array) -> void:
	possible_dirs.erase(-direction)  # ne pas revenir en arrière

	if possible_dirs.size() > 0:
		direction = possible_dirs[randi() % possible_dirs.size()]
