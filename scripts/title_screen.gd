extends Control

var reticle = load("res://assets/Title Screen/Roret_Cursor/png/cursor_select.png")
var press_reticle = load("res://assets/Title Screen/Roret_Cursor/png/cursor_select_tap.png")
@onready var play_button_cursor = $Play_Button_Cursor
@onready var option_button_cursor = $Option_Button_Cursor
@onready var menu_1 = $"."
@onready var menu_2 = $main
@onready var parallax_background = $ParallaxBackground
@onready var line_edit = $LineEdit
@onready var label = $Label


var menu_transition_time = 1.5
var menu_origin_position := Vector2.ZERO
var current_menu
const menu_origin_size = Vector2(720,1280)
var menu_stack := []
func _ready():
	Input.set_custom_mouse_cursor(reticle,0, Vector2(0,0))
	play_button_cursor.hide()
	option_button_cursor.hide()
	menu_origin_position = Vector2(0,0)
	current_menu = menu_1
	
func move_to_next_menu(next_menu_id: String):
	var next_menu = get_menu_from_menu_id(next_menu_id)
	var tween = create_tween()
	tween.parallel().tween_property(next_menu, "position", menu_origin_position, menu_transition_time)
	tween.parallel().tween_property(current_menu, "position", Vector2(0, -menu_origin_size.y), menu_transition_time)
	menu_stack.append(current_menu)
	current_menu = next_menu

func get_menu_from_menu_id(menu_id: String) -> Control:
	match menu_id:
		"menu_1":
			return menu_1
		"menu_2":
			return menu_2
		_:
			return menu_1
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



func _on_btn_play_mouse_entered():
	print("Hovered on")
	play_button_cursor.show()



func _on_btn_play_mouse_exited():
	print("Hovered out")
	play_button_cursor.hide()



func _on_btn_option_mouse_entered():
	option_button_cursor.show()


func _on_btn_option_mouse_exited():
	option_button_cursor.hide()


func _on_btn_play_pressed():
	if line_edit.text.strip_edges() == "":
		label.show()
		print("Access not Granted!")
	else:
		label.hide()
		var timer = Timer.new()
		timer.wait_time = 2
		timer.one_shot = true
		add_child(timer)
		timer.timeout.connect(move_to_next_scene)
		move_to_next_menu("menu_1")
		timer.start()
	
func move_to_next_scene():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
func _on_btn_option_pressed():
	pass # Replace with function body.
