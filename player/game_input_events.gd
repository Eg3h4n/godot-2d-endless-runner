class_name GameInputEvents

extends Node

static func movement_input() -> float:
	var direction: float = Input.get_axis("move_left", "move_right")
	return direction
	
static func start_running() -> bool:
	var run_input := Input.is_action_just_pressed("move_right")
	return run_input

static func jump_input() -> bool:
	var jump_input := Input.is_action_just_pressed("jump")
	return jump_input

static func fall_input() -> bool:
	var fall_input := Input.is_action_just_pressed("force_fall")
	return fall_input

static func pause_input() -> bool:
	var pause_input := Input.is_action_just_pressed("pause")
	return pause_input
