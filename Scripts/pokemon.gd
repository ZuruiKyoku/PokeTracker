extends Button

@onready var sprite = $Sprite
@onready var number = $Number
const UNKNOWN_OPAQUE = preload("res://Images/home3d-icon/unknown-opaque.png")

var thisPokemon
var pokemonID:String

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.self_modulate = Color.BLACK
	
func ClearPokemon():
	number.text = ""
	sprite.texture = UNKNOWN_OPAQUE
	sprite.self_modulate = Color.BLACK
	disabled = true

func SetPokemon(pokemon):
	thisPokemon = pokemon
	pokemonID = pokemon["Dex"]
	number.text = "[center]" + str(pokemonID)
	sprite.texture = load("res://Images/home3d-icon/regular/" + pokemon["Keyword"] + ".png")
	if thisPokemon["Caught"]:
		sprite.self_modulate = Color.WHITE
	disabled = false

func _on_button_up():
	#Audio.PlayClick()
	if !thisPokemon["Caught"]:
		sprite.self_modulate = Color.WHITE
		thisPokemon["Caught"] = true;
		Globals.caughtMons += 1
	elif thisPokemon["Caught"]:
		sprite.self_modulate = Color.BLACK
		thisPokemon["Caught"] = false
		Globals.caughtMons -= 1	
