extends Node

@onready var animation_player = $AnimationPlayer
@onready var music = $Music
@onready var click = $Click

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("Fade_In")
	var buttons: Array = get_tree().get_nodes_in_group("Buttons")
	for inst in buttons:
		inst.connect("pressed", self, "button_up")

func on_button_pressed()->void:
	click.playing = true
