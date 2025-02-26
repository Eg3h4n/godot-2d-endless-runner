extends Node

@export var ground1 : TileMapLayer
@export var ground2 : TileMapLayer
@export var player: CharacterBody2D

var current_ground_number : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_ground_number = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("in body enter with count: ", current_ground_number)
	if !body.is_in_group("Player"):
		return
	print("body entered")
	if current_ground_number == 0:
		current_ground_number += 1
		print("current ground number: ", current_ground_number)
		return
	current_ground_number += 1
	if current_ground_number % 2 == 0:
		#ground1.enabled = false
		print("moving ground 1 from: ", ground1.global_position)
		ground1.global_position = Vector2(ground1.global_position.x + 2560, ground1.global_position.y)
		print("moving ground 1 to: ", ground1.global_position)
		#ground1.enabled = true
	else:
		#ground2.enabled = false
		print("moving ground 2 from: ", ground2.global_position)
		ground2.global_position = Vector2(ground2.global_position.x + 2560, ground2.global_position.y)
		print("moving ground 2 to: ", ground2.global_position)
		#ground2.enabled = true
	
	
	print("current ground number: ", current_ground_number)
