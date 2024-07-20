extends Control
@onready var popup_quest = %PopupQuest
@onready var popup_shop = %PopupShop
@onready var popup_friends = %PopupFriends
@onready var popup_ranks = %PopupRanks
@onready var popup_settings = %PopupSettings

@onready var coin_num_lbl = $UI/CoinNum2/CoinNumLbl


var coin: int = 0

# Bottom widget buttons
func _on_btn_quest_pressed():
	popup_quest.show()

func _on_btn_shop_pressed():
	popup_shop.show()

func _on_btn_friends_pressed():
	popup_friends.show()

func _on_btn_ranks_pressed():
	popup_ranks.show()

func _on_btn_settings_pressed():
	popup_settings.show()




# Main tap tap function
func _on_tap_button_pressed():
	coin += 1
	coin_num_lbl.text = str(coin)
