extends Node

const BASE_WIDTH = 320
const BASE_HEIGHT = 200

var display_size = DisplayServer.window_get_size()
var targeted_display_ratio = 1 # placeholder
var targeted_display_size: Vector2

var window_size = DisplayServer.window_get_size()
var targeted_window_ratio = 1 # placeholder
var targeted_window_size: Vector2

func _ready():
	targeted_display_ratio = floor(display_size.y / BASE_HEIGHT)
	targeted_display_size.x = BASE_WIDTH * targeted_display_ratio
	targeted_display_size.y = BASE_HEIGHT * targeted_display_ratio
	
	if (targeted_display_ratio < 2):
		targeted_display_ratio = 2 
	
	targeted_window_size.x = BASE_WIDTH * (targeted_display_ratio - 1)
	targeted_window_size.y = BASE_HEIGHT * (targeted_display_ratio -1)
	
	if (DisplayServer.WINDOW_MODE_FULLSCREEN):
		get_viewport().get_visible_rect().size = targeted_display_size
	else:
		get_viewport().get_visible_rect().size = targeted_window_size
