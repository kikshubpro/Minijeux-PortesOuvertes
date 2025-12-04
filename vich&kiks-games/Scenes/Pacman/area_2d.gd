extends Area2D

@export var possible_dirs: Array = [Vector2.DOWN, Vector2.UP, Vector2.LEFT]

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	if body.has_method("choose_direction"):
		body.choose_direction(possible_dirs)
