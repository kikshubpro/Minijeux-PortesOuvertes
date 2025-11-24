extends AnimatedSprite2D

var speed = 200  # Vitesse du personnage
var velocity = Vector2.ZERO  # Vitesse initiale

# Référence à l'AnimatedSprite2D
@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	# Assurez-vous que l'animation "idle" existe dans le SpriteFrames et qu'elle est configurée
	animated_sprite.play("idle")

func _process(delta):
	velocity = Vector2.ZERO  # Réinitialise la vitesse à chaque frame

	# Détecte les touches directionnelles et joue l'animation correspondante
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
		animated_sprite.play("walk_right")  # Assure-toi que cette animation est définie dans SpriteFrames
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -1
		animated_sprite.play("walk_left")
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
		animated_sprite.play("walk_up")
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1
		animated_sprite.play("walk_down")

	# Si aucune touche n'est pressée, on joue l'animation "idle"
	if velocity == Vector2.ZERO:
		animated_sprite.play("idle")

	# Déplacer le personnage avec move_and_slide
	move_and_slide(velocity)
