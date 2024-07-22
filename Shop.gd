extends TextureRect
@onready var btn_shop = $"../BotBarWidgets/Background/MarginContainer/GridContainer/btnShop"
@onready var items = $MarginContainer/ScrollContainer/items


# Function to populate item slots
func populate_items():
	var vbox = items  # Replace with the path to your VBoxContainer
	var item_slots = vbox.get_children()
	var items_keys = ItemData.food_and_drink.keys()  # Directly access the autoloaded ItemData

	for slot in item_slots:
		if slot is TextureButton:  # Replace with the correct type of your item slot scene
			var random_key = items_keys[randi() % items_keys.size()]
			var item_data = ItemData.food_and_drink[random_key]
			
			slot.set_item(
				item_data["Name"], 
				item_data["Des"], 
				item_data["Cost"], 
				item_data["Icon"]
			)

# Function to toggle the shop's visibility
func toggle_shop():
	visible = not visible
	if visible:
		populate_items()

func _ready():
	btn_shop.connect("pressed", toggle_shop)
	randomize()  # Ensure random number generator is seeded
	hide()  # Initially hide the shop
