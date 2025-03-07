extends Node
@onready var spawn_timer: Timer = $Timer

@export var enemy_character_body_2d: PackedScene
@export var camera : Camera2D
@export var player_character_body_2d: CharacterBody2D

var spawn_offset_x: float = 100  # Distance from camera edge
var spawn_range_y: float = 200  # Random Y spawn range

var enemy_pool: Array = []

func spawn_enemy():
	if not camera or not enemy_character_body_2d:
		return  # Ensure camera exists and enemy scene is assigned
		
	var enemy
	if enemy_pool.size() > 0:
		enemy = enemy_pool.pop_front()  # Reuse an old enemy
	else:
		enemy = enemy_character_body_2d.instantiate() # Create a new one
		add_child(enemy)  
	
	 # Get camera position and viewport size
	var camera_pos = camera.global_position
	var viewport_size = get_viewport().get_visible_rect().size
	
	# Spawn enemy slightly off-screen to the right
	var spawn_x = camera_pos.x + viewport_size.x / 2 + spawn_offset_x
	var spawn_y = camera_pos.y
	enemy.global_position = Vector2(spawn_x, spawn_y)
	enemy.set_active(true) 
	# Randomize spawn time
	spawn_timer.wait_time = randf_range(1.5, 4.0)
	spawn_timer.start()

func start_timer():
	spawn_timer.start()

func _on_timer_timeout() -> void:
	spawn_enemy()
