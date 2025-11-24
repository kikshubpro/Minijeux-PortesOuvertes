extends Node2D  # Nous utilisons Node2D pour le déplacement

var speed = 200  # Vitesse de déplacement de Pac-Man
var velocity = Vector2.ZERO  # Vitesse initiale du personnage

func _process(delta):
	velocity = Vector2.ZERO  # Réinitialise la vitesse à chaque frame

	# Détecte les touches fléchées pour déplacer Pac-Man
	if Input.is_action_pressed("ui_right"):  # Flèche droite
		velocity.x += 1 # Déplace Pac-Man vers la droite
		while true:
			if (Input.is_action_pressed("ui_left") or
		 	Input.is_action_pressed("ui_down") or
			Input.is_action_pressed("ui_up")):
				break
				
	if Input.is_action_pressed("ui_left"):  # Flèche gauche
		velocity.x -= 1  # Déplace Pac-Man vers la gauche
	if Input.is_action_pressed("ui_down"):  # Flèche bas
		velocity.y += 1  # Déplace Pac-Man vers le bas
	if Input.is_action_pressed("ui_up"):  # Flèche haut
		velocity.y -= 1
		   # Déplace Pac-Man vers le haut

	# Normalise la direction pour éviter que Pac-Man se déplace plus vite en diagonale
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed  # Appliquer la vitesse

		# Déplacer Pac-Man en fonction de la direction
		position += velocity * delta  # Déplacer le Node2D
