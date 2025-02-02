extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var motion = Vector2.ZERO
	if Input.is_action_pressed('move_left'):
		motion.x -= 1
	if Input.is_action_pressed('move_right'):
		motion.x += 1
	if Input.is_action_pressed('jump'):
		motion.y -=1
		
	# Always apply a small gravitational force
	motion.y += 0.05
		
	if motion.y < 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = motion.y > 0
		$AnimatedSprite2D.flip_h = motion.x < 0
	elif motion.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = motion.x < 0
	else:
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.animation = "idle"

	if motion.length() > 0:
		motion = motion.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	move_and_collide(motion * delta)
	# TODO: don't allow the player to move off screen

func _on_body_entered(_body: Node2D) -> void:
	print("Something entered")
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
