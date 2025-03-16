extends CharacterBody2D
class_name Enemy

@onready var player: Player = get_node("/root/Main/Player")
@export var movement_speed: float = 60

func _physics_process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * movement_speed
		look_at(player.global_position)
	else:
		velocity = Vector2.ZERO
	move_and_slide()
