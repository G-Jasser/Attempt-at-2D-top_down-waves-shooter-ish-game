extends Area2D
class_name HitboxCmp

@export var health_cmp: HealthCmp

func take_damage(points: int) -> void:
	if health_cmp:
		health_cmp.damage(points)
