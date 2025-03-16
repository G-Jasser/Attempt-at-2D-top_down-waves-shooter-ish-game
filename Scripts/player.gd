extends CharacterBody2D
class_name Player

@onready var crosshair: Sprite2D = $"../crosshair"

@export var movement_speed: float = 105
var health_points: int = 10

func _physics_process(delta):
	get_input()
	move_and_slide()


func get_input():
	look_at(crosshair.position)
	
	var direction = Input.get_vector("move_left", "move_right","move_up","move_down")
	if direction:
		velocity = direction * movement_speed
	else:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
		velocity.y = move_toward(velocity.y, 0, movement_speed)


func take_damage(points: int = 1):
	health_points -= points
	if health_points <= 0:
		die()


func die():
	queue_free()
