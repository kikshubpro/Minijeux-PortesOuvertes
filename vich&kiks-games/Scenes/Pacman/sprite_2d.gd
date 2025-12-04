extends Area2D

# Directions possibles pour CETTE intersection
# (tu pourras changer la liste dans l'inspecteur)
@export var possible_dirs: Array = []

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	if body.has_method("choose_direction"):
		body.choose_direction(possible_dirs)
