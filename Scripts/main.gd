extends Control

@onready var animplayer = $AnimationPlayer
@onready var menu_options = $MenuOptions

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_button_up():
	animplayer.play("OpenMenu")

func option_pressed(option:Globals.Option):
	animplayer.play("CloseMenu")
	await animplayer.animation_finished
	if option == Globals.Option.Home:
		animplayer.play("ShowTrackerType")

func trackerTypeSelected(type:Globals.TrackerType):
	Globals.TrackerType
