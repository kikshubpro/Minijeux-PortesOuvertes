extends Node2D

var speed = 200  # Vitesse du personnage
var velocity = Vector2.ZERO  # Vitesse initiale

func _process(delta):
	velocity = Vector2.ZERO  # Réinitialise la vitesse à chaque frame

	# Si une touche horizontale est pressée, on ne regarde pas les touches verticales
	if Input.is_action_pressed("ui_right"):  # Flèche droite
		velocity.x = 1  # Déplacement à droite
	elif Input.is_action_pressed("ui_left"):  # Flèche gauche
		velocity.x = -1  # Déplacement à gauche

	# Si une touche verticale est pressée, on ne regarde pas les touches horizontales
	if Input.is_action_pressed("ui_up"):  # Flèche haut
		velocity.y = -1  # Déplacement vers le haut
	elif Input.is_action_pressed("ui_down"):  # Flèche bas
		velocity.y = 1  # Déplacement vers le bas

	# Appliquer la vitesse
	velocity = velocity.normalized() * speed

	# Déplacer le personnage
	position += velocity * delta
