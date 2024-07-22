extends VBoxContainer



# Function to populate item slots
func populate_items():
	var vbox = $VBoxContainer  # Replace with the path to your VBoxContainer
	var item_slots = vbox.get_children()
	var items_keys = food_and_drink.keys()

	for slot in item_slots:
		if slot is ItemSlot:  # Replace with the correct type of your item slot scene
			var random_key = items_keys[randi() % items_keys.size()]
			var item_data = food_and_drink[random_key]
			
			slot.set_item(
				item_data["Name"], 
				item_data["Des"], 
				item_data["Cost"], 
				item_data["Icon"]
			)

# Call the function to populate items
func _ready():
	populate_items()
