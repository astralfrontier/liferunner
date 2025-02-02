extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func game_over() -> void:
	pass

func new_game():
	# TODO: signal to the player that gravity is happening, OR move gravity implementation here
	$Player.start($StartPosition.position)
