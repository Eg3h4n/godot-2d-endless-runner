extends Node

const KNIGHT_CHARACTER_BODY_2D = preload("res://enemies/knight/knight_character_body_2d.tscn")

var spawn_offset_x: float = 100  # Distance from camera edge
var spawn_range_y: float = 200  # Random Y spawn range
var spawn_timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	# Create and configure the timer
	spawn_timer = Timer.new()
	spawn_timer.wait_time = randf_range(1.5, 4.0)  # Random interval between spawns
	spawn_timer.one_shot = false
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	add_child(spawn_timer)
	spawn_timer.start()

func _on_spawn_timer_timeout():
	var camera = get_viewport().get_camera_2d()
	if not camera or not KNIGHT_CHARACTER_BODY_2D:
		return  # Ensure camera exists and enemy scene is assigned
	var parent = get_tree().current_scene  # Get the current scene to add enemies
	if not parent:
		return
	var enemy = KNIGHT_CHARACTER_BODY_2D.instantiate() as CharacterBody2D
	parent.add_child(enemy)
	# Get camera position and viewport size
	var camera_pos = camera.global_position
	var viewport_size = get_viewport().get_visible_rect().size
	# Spawn enemy slightly off-screen to the right
	var spawn_x = camera_pos.x + viewport_size.x / 2 + spawn_offset_x
	var spawn_y = camera_pos.y

	enemy.global_position = Vector2(spawn_x, spawn_y)

	# Reset timer with a new random interval
	spawn_timer.wait_time = randf_range(1.5, 4.0)
	spawn_timer.start()
	
#func generate_enemy():
#	var enemy_instance = KNIGHT_CHARACTER_BODY_2D.instantiate()
#	var cam = get_tree().current_scene.get_node("%Camera2D") as Camera2D
#	enemy_instance.global_position = cam.
