extends Node

var id = 0
var principal_id = 0
var currentCoin = 0
var currentAddingCoin = 0
var autoClicks = 0
var levelNum = 0
var level_lbl = ""
var levelImage : Resource


func _ready():
	var s = SaveManager.read_save()
	id = s.id
	principal_id = s.principal_id
	currentCoin = s.currentCoin
	currentAddingCoin = s.currentAddingCoin
	autoClicks = s.autoClicks
	levelNum = s.levelNum


func get_level_lbl(level: int) -> Dictionary:
	var level_lbl = get_level_lbl(level)  # Get the appropriate store based on player level
	var levelBarName := {4: "Corporation", 3: "Store owner", 2:"Street Vendor", 1:"Takatak"}

	if level >= 30:
		return levelBarName[4]
	elif level >= 20:
		return levelBarName[3]
	elif level >= 10:
		return levelBarName[2]
	else:
		return levelBarName[1]









func addCoin():
	currentCoin + currentAddingCoin

func addAutoClickCoin():
	currentCoin += autoClicks * currentAddingCoin


func profitPerHour():
	return format_score_output(autoClicks * currentAddingCoin)



func format_score_output(currentCoin):
	if(currentCoin > 999 and currentCoin < 1000000):
		return str(int(currentCoin / 1000)) + "." + validateIsUnity(float(currentCoin)/1000 - (currentCoin / 1000)).substr(0,2) + " K"
	if(currentCoin > 999999):
		return str(int(currentCoin / 1000000)) + "." + validateIsUnity(float(currentCoin)/1000000 - (currentCoin / 1000000)).substr(0,2) + " M"
	return str(currentCoin)

func validateIsUnity(result):
	if(result < 0.1):
		return "0"
	if(result >= 0.1 and result < 1):
		return str(result).substr(2,1)
	else:
		return str(result)


