extends Node2D  # Nous étendons Node2D, car c'est un nœud non physique

var speed = 200  # Vitesse de déplacement du personnage
var velocity = Vector2.ZERO  # Initialiser la vitesse (vitesse nulle par défaut)


func _process(delta):
	velocity = Vector2.ZERO  # Réinitialiser la vitesse à chaque frame

	# Détecte les touches fléchées pour déplacer Pac-Man
	if Input.is_action_pressed("ui_right"):  # Flèche droite
		velocity.x += 1  # Déplacer Pac-Man vers la droite
	if Input.is_action_pressed("ui_left"):  # Flèche gauche
		velocity.x -= 1  # Déplacer Pac-Man vers la gauche
	if Input.is_action_pressed("ui_down"):  # Flèche bas
		velocity.y += 1  # Déplacer Pac-Man vers le bas
	if Input.is_action_pressed("ui_up"):  # Flèche haut
		velocity.y -= 1  # Déplacer Pac-Man vers le haut

	# Normaliser la direction pour éviter que Pac-Man se déplace plus vite en diagonale
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed  # Appliquer la vitesse

		# Déplacer Pac-Man en fonction de la direction
		position += velocity * delta  # Déplacer le Node2D
