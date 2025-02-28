extends Node

const START_GAME_SCREEN = preload("res://ui/start_game_screen.tscn")
const PAUSE_MENU_SCREEN = preload("res://ui/pause_menu_screen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameInputEvents.pause_input() and !get_tree().paused:
		pause_game()
	
func exit_game():
	get_tree().quit()
	
func pause_game():
	get_tree().paused = true
	var pause_menu_screen_instance = PAUSE_MENU_SCREEN.instantiate()
	get_tree().root.add_child(pause_menu_screen_instance)
	
func continue_game():
	get_tree().paused = false
