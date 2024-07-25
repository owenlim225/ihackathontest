extends CanvasLayer

@onready var shop = $Shop
@onready var coin_num_lbl = $CoinNumLbl
@onready var level_num_lbl = $TopBarWidgets/MarginContainer/GridContainer/levelNum/LevelNumLbl
@onready var level_bar_name = $TopBarWidgets/MarginContainer/GridContainer/levelBar/LevelBarName
@onready var level_bar_num = $TopBarWidgets/MarginContainer/GridContainer/levelBar/LevelBarNum
@onready var texture_progress_bar = $TopBarWidgets/MarginContainer/GridContainer/levelBar/TextureProgressBar



func _ready():
	level_num_lbl.text = str(Global.levelNum)
	level_bar_name = str(Global.level_lbl)
	
	



# Function for tap tap tap biutch
func _on_btn_tap_pressed():
	Global.currentCoin += 1
	coin_num_lbl.text = str(Global.currentCoin)










func _on_btn_shop_pressed():
	shop.show()
