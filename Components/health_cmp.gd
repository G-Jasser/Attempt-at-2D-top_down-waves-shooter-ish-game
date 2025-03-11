extends Node2D
class_name HealthCmp


@export var max_health: int = 10
var health: int

func _ready():
	health = max_health

func damage(points: int) -> void:
	health-= points
	if health <= 0:
		die()

func die() -> void:
	# TODO: Remove print
	# TODO: Play animation
	print(get_parent().name," died!!")
	get_parent().queue_free()
