extends Node

var itemData = {}

var data_file_path = "res://Data/StaticData.json"


func _ready():
	itemData = load_json_file(data_file_path)


func load_json_file(filePath: String):
	if FileAccess.file_exists(filePath):
		
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var ParsedResult = JSON.parse_string(dataFile.get_as_text())
		
		if ParsedResult is Dictionary:
			return ParsedResult
		else:
			printerr("Error reading file")
	else:
		printerr("File doesn't exist!")
