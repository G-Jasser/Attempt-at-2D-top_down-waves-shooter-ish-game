extends Area2D
class_name HurtBox

@export var hurt_points:int = 1
@export_flags_2d_physics var target_layer_mask = 0

func _ready():
	collision_mask = target_layer_mask

func _on_area_entered(area: Node2D):
	if area is HitboxCmp:
		area.take_damage(hurt_points)
