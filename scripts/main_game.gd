extends Control

var coin = Global.coin

@onready var coin_num_lbl = $UI/CoinNum2/CoinNumLbl

func _on_tap_button_pressed():
	coin += 1
	coin_num_lbl.text = str(coin)
