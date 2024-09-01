extends Control

@onready var pokemon_box = $PokemonBox
# Called when the node enters the scene tree for the first time.
func _ready():
	ChangeBox(1, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func ChangeBox(page:int, box:int):
	var num = 1
	if Globals.dexDict.size() == 0:
		Globals.LoadJson()
	for n in range(1, pokemon_box.get_child_count() + 1):
		pokemon_box.find_child("Pokemon" + str(n)).ClearPokemon()
		
	for mon in Globals.dexDict["Pokemon"]:
		if int(mon["Page"]) == page && int(mon["Box"]) == box && int(mon["No"]) == num:
			pokemon_box.find_child("Pokemon" + str(num)).SetPokemon(mon)
			num += 1
			if num > 30:
				break
	
