extends TextureButton

@onready var item_name = $MarginContainer/VBoxContainer/itemName
@onready var item_profit = $MarginContainer/VBoxContainer/HBoxContainer/itemProfit
@onready var item_cost = $MarginContainer2/HBoxContainer/HBoxContainer/itemCost
@onready var item_level = $MarginContainer2/HBoxContainer/itemLevel
@onready var item_icon = $itemIcon

func set_item(name: String, profit: int, cost: int, level: int, icon_path: String):
	item_name.text = name
	item_profit.text = str(profit)
	item_cost.text = str(cost)
	item_level.text = str(level)
	item_icon.texture = load(icon_path)



