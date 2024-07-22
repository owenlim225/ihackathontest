extends CanvasLayer

@onready var shop = $Shop
@onready var coin_num_lbl = $CoinNumLbl

# Function for tap tap tap biutch
func _on_btn_tap_pressed():
	Global.coin += 1
	coin_num_lbl.text = str(Global.coin)










func _on_btn_shop_pressed():
	shop.show()
