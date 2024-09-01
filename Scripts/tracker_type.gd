extends Control

var parent : Node

func _ready():
	parent = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func TypeSelected(type:Globals.TrackerType):
	parent.trackerTypeSelected(type)

func _on_living_button_up():
	TypeSelected(Globals.TrackerType.Living)
