extends NodeState

@export var character_body_2d : CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D

const GRAVITY: int = 800

func on_process(delta : float):
	pass
	
func on_physics_process(delta : float):
	if !character_body_2d.is_on_floor():
		character_body_2d.velocity.y += GRAVITY * delta
	
	character_body_2d.move_and_slide()
	
	#transition states
	#idle state
	if character_body_2d.is_on_floor():
		transition.emit("EnemyRun")
	
func enter():
	animated_sprite_2d.play("fall")

	
func exit():
	animated_sprite_2d.stop()
