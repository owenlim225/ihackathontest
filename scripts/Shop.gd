extends TextureRect
@onready var btn_shop = $"../BotBarWidgets/Background/MarginContainer/GridContainer/btnShop"
@onready var items = $MarginContainer/ScrollContainer/vboxcontainer/items

# Function to get the correct store dictionary based on player level
func get_store_for_level(level: int) -> Dictionary:
	if level >= 30:
		return ItemData.store4
	elif level >= 20:
		return ItemData.store3
	elif level >= 10:
		return ItemData.store2
	else:
		return ItemData.store1

# Function to populate item slots
func populate_items(level: int):
	var vbox = items  # Replace with the path to your VBoxContainer
	var itemShop = vbox.get_children()
	var store = get_store_for_level(level)  # Get the appropriate store based on player level
	var items_keys = store.keys()  # Access the correct store dictionary

	# Remove existing item slots if any
	for slot in itemShop:
		slot.queue_free()

	# Preload the item shop scene
	var item_shop_scene = preload("res://scenes/UI/itemShop.tscn")

# Add new item slots, limiting to 22
	var slot_count = 0
	for key in items_keys:
		if slot_count >= 24:
			break  # Stop adding slots if the limit is reached

		var item_data = store[key]
		var new_slot = item_shop_scene.instantiate()
		vbox.add_child(new_slot)

		new_slot.set_item(
			item_data["Name"], 
			item_data["Profit"], 
			item_data["Cost"], 
			item_data["Level"], 
			item_data["Icon"]
		)
		slot_count += 1


# Function to toggle the shop's visibility
func toggle_shop():
	visible = not visible
	if visible:
		populate_items(Global.levelNum)

func _ready():
	btn_shop.connect("pressed", toggle_shop)
	randomize()  # Ensure random number generator is seeded
	hide()  # Initially hide the shop
