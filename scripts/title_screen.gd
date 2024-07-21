extends Control

var reticle = load("res://assets/Roret_Cursor/png/cursor_select.png")
var press_reticle = load("res://assets/Roret_Cursor/png/cursor_select_tap.png")

func _ready():
	Input.set_custom_mouse_cursor(reticle,0, Vector2(0,0))


func _on_button_3_button_down():
	Input.set_custom_mouse_cursor(press_reticle,0, Vector2(0,0))

func _on_button_3_button_up():
	Input.set_custom_mouse_cursor(reticle,0, Vector2(0,0))


func _on_button_button_up():
	Input.set_custom_mouse_cursor(reticle,0, Vector2(0,0))


func _on_button_button_down():
	Input.set_custom_mouse_cursor(press_reticle,0, Vector2(0,0))


func _on_button_2_button_down():
	Input.set_custom_mouse_cursor(press_reticle,0, Vector2(0,0))

func _on_button_2_button_up():
	Input.set_custom_mouse_cursor(reticle,0, Vector2(0,0))

func btn_hovered(button: Button):
	if button.is_hovered():
		pass
