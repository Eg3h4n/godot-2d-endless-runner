extends CanvasLayer

func _ready():
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameInputEvents.pause_input() and get_tree().paused:
		GameManager.continue_game()
		queue_free()
