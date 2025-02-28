extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_hurt_box_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		get_tree().paused = true
