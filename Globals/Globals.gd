extends Node
var save_path := "user://player_data.json"
#const DEX_TYPES = preload("res://Files/DexTypes.tres")

#var MAIN_MENU = preload("res://Scenes/main_menu.tscn")
#var BOX_CHECKLIST = preload("res://Scenes/box_checklist.tscn")

var SelectedDex:String = ""
var WallpaperIndex:int = 0
var dexDict:Dictionary
var caughtMons:int = 0

enum Scenes {Main, Checklist}

enum Option {Pokedex, Home, Shiny}
enum TrackerType {Living, LivingFinalForm, LivingForm, ShinyLiving, ShinyLivingFinalForm, ShinyLivingForm}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func LoadJson():
	var file = "res://JSON/" + SelectedDex + ".json"
	var json_as_text = FileAccess.get_file_as_string(file)
	dexDict = JSON.parse_string(json_as_text)
	if dexDict:
		for mon in dexDict["Pokemon"]:
			if mon["Caught"]:
				caughtMons += 1

func SaveJson(_fileToSave:String):
	pass

func SetChecklist(parent, checklist:String):
	ResetVals()
	SelectedDex = checklist
	ChangeScene(parent, Scenes.Checklist)

func ChangeScene(parent, scene):
	var newScene = null
	if scene == Scenes.Main:
		pass
#		newScene = MAIN_MENU.instantiate()
	elif scene == Scenes.Checklist:
		pass
#		newScene = BOX_CHECKLIST.instantiate()
	else:
		pass
	
	get_tree().root.add_child.call_deferred(newScene)
	if parent:
		parent.queue_free()
		
func ResetVals():
	dexDict.clear()
	SelectedDex = ""
	caughtMons = 0
