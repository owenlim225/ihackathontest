extends Control

@onready var shop = $Shop
@onready var coin_num_lbl = $CoinNumLbl
@onready var lower_bg = $LowerBG
@onready var test_store = $testStore
@onready var canvas_layer = $"."
@onready var ui = $UI
@onready var color_rect = $ColorRect



# Function for tap tap tap biutch
func _on_btn_tap_pressed():
	Global.coin += 1
	coin_num_lbl.text = str(Global.coin)

func _ready():
	var tween = create_tween()
	var timer = Timer.new()
	ui.hide()
	timer.wait_time = 2 # Wait for 1 second
	timer.one_shot = true  # Only trigger once
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	tween.parallel().tween_property(color_rect, "position", Vector2(0, -2560), 1)
	tween.parallel().tween_property(lower_bg, "position", Vector2(0, -574), 1)
	tween.parallel().tween_property(test_store, "position", Vector2(118, -863), 1)
	#tween.parallel().tween_property(canvas_layer, "position", Vector2(0, -574), 1)
	timer.start()
func _on_timer_timeout():
	ui.show()
