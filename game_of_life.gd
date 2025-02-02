extends Node2D

# https://github.com/NexusrexDev/GodotGameOfLife/blob/master/Base.gd

var grid_size # Size of the game window.
var cells: Array

func cells_to_pattern() -> TileMapPattern:
	var pattern: TileMapPattern
	for i in range(grid_size.x):
		for j in range (grid_size.y):
			# TODO: source_id or atlas_coords
			pattern.set_cell(Vector2i(i, j), -1, Vector2i(-1, -1), -1)
	return pattern

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grid_size = get_viewport_rect().size / 16
	for i in range(grid_size.x):
		cells.append([])
		for _j in range (grid_size.y):
			cells[i].append(randi() % 2)
	# TODO: ensure an open space around the starting area
	# TODO: ensure an open space around some eventual goal area

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
