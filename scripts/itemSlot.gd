extends TextureButton

@onready var item_icon = $ItemPanel/itemIcon
@onready var item_name = $itemName
@onready var item_des = $itemDes
@onready var item_cost = $itemCost


func set_item(name: String, description: String, cost: int, icon_path: String):
	item_name.text = name
	item_des.text = description
	item_cost.text = str(cost)
	item_icon.texture = load(icon_path)



