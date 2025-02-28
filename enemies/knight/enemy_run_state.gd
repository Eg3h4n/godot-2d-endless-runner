extends NodeState

@export var character_body_2d : CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export_category("Run State")
@export var speed := 500
@export var max_horizontal_speed := 300

func on_process(delta : float):
	pass
	
func on_physics_process(delta : float):

	character_body_2d.velocity.x += -1 * speed
	character_body_2d.velocity.x = clamp(character_body_2d.velocity.x, -max_horizontal_speed, max_horizontal_speed)
	
	character_body_2d.move_and_slide()
	
	if !character_body_2d.is_on_floor():
		transition.emit("EnemyFall")
func enter():
	animated_sprite_2d.play("run")
	
func exit():
	animated_sprite_2d.stop()
