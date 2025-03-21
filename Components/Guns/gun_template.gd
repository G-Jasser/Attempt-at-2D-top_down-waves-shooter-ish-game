extends Node2D
class_name GunTemplate

@export var gun_stats: GunStat

var time_since_last_shot: float = 0.0

func track_time_since_last_shot(delta) -> void:
	time_since_last_shot += delta

func is_ready_to_shoot() -> bool:
	if time_since_last_shot >= gun_stats.fire_rate:
		return true
	else:
		return false

func has_fired() -> void:
	time_since_last_shot = 0.0


func shoot(delta) -> void:
	pass

func get_gun_stats() -> void:
	pass
