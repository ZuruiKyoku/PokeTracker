extends Control

var parent : Node

func _ready():
	parent = get_parent()

func _on_pokedex_button_up():
	option_pressed(Globals.Option.Pokedex)


func _on_home_tracker_button_up():
	option_pressed(Globals.Option.Home)


func _on_shiny_hunt_button_up():
	option_pressed(Globals.Option.Shiny)


func option_pressed(option):
	parent.option_pressed(option)
