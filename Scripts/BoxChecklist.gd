extends Control

@onready var box_number = $BoxNumber
@onready var page_number = $PageNumber

@onready var dex_name = $DexName
@onready var number_of_mons = $NumberOfMons

@onready var box = $Box

var currentBox:int = 1
var minBox:int = 1
var maxBox:int = 30
var maxBoxLastPage = 0
var currentPage:int = 1
var minPage:int = 1
var maxPage:int = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.dexDict:
		dex_name.text = "[center][b]" + str(Globals.dexDict["Title"])
		number_of_mons.text = "[center][b]" + str(Globals.caughtMons) + "/" + str(Globals.dexDict["Pokemon"].size())
		maxPage = int(Globals.dexDict["Pokemon"][Globals.dexDict["Pokemon"].size()-1]["Page"])
		maxBoxLastPage = int(Globals.dexDict["Pokemon"][Globals.dexDict["Pokemon"].size()-1]["Box"])
	UpdateBoxNumber()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	number_of_mons.text = "[center][b]" + str(Globals.caughtMons) + "/" + str(Globals.dexDict["Pokemon"].size())

func _on_previous_button_up():
	#Audio.PlayClick()
	ChangeBox("prev")

func _on_next_button_up():
	#Audio.PlayClick()
	ChangeBox("next")

func ChangeBox(dir:String):
	if dir == "prev":
		if currentBox > minBox:
			currentBox -= 1
		elif currentBox == minBox:
			currentBox = maxBox
			if currentPage > minPage:
				currentPage -= 1
				if currentPage == minPage:
					maxBox = 30
					currentBox = maxBox
			elif currentPage == minPage:
				currentPage = maxPage
				maxBox = maxBoxLastPage
				currentBox = maxBox
	elif dir == "next":
		if currentBox < maxBox:
			currentBox += 1
		elif currentBox == maxBox:
			currentBox = minBox
			if currentPage < maxPage:
				currentPage += 1
				if currentPage == maxPage:
					maxBox = maxBoxLastPage
			elif currentPage == maxPage:
				currentPage = minPage
				maxBox = 30
	
	UpdateBoxNumber()
	box.ChangeBox(currentPage, currentBox)

func UpdateBoxNumber():
	page_number.text = "[center][b]Page " + str(currentPage)
	box_number.text = "[center][b]Box " + str(currentBox)


func _on_save_button_up():
	#Audio.PlayClick()
	#Save JSON
	Globals.SaveJson("")
	Close()
	
func Close():
	Globals.ChangeScene(self, Globals.Scenes.Main)
