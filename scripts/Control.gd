extends Control

@onready var label = $Label

var count: int = 0


func _on_button_pressed():
	count += 1
	label.text = str(count)
