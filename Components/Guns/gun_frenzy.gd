extends GunTemplate
class_name GunFrenzy

@export var gun_frenzy_stats: GunFrenzyStat

func is_ready_to_shoot() -> bool:
	if time_since_last_shot >= gun_frenzy_stats.fire_rate:
		return true
	else:
		return false

func shoot(delta: float) -> void:
	if is_ready_to_shoot():
		var random_chance: float = randf_range(0, 100)
		var bullet: Node2D = gun_frenzy_stats.bullet_scene.instantiate()
		
		if random_chance <= gun_frenzy_stats.accuracy:
			bullet.global_transform = global_transform
			
		else:
			var random_angle: float = randf_range(-gun_frenzy_stats.spread_angle, gun_frenzy_stats.spread_angle)
			var bullet_angle: float = deg_to_rad(random_angle)
			var final_angle: float = global_rotation + bullet_angle
			
			var bullet_transform: Transform2D = Transform2D(final_angle, global_position)
			bullet.global_transform = bullet_transform
		
		get_tree().root.add_child(bullet)
		has_fired()
