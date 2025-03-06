extends CharacterBody2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(_on_visible_on_screen_notifier_2d_screen_exited)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	return_to_pool()  # Remove the enemy when it exits the screen
	
func return_to_pool():
	get_parent().enemy_pool.append(self)  # Add back to pool
	set_active(false)  # Deactivate instead of deleting

func set_active(value):
	visible = value
	set_physics_process(value)  # Stop movement calculations if inactive
