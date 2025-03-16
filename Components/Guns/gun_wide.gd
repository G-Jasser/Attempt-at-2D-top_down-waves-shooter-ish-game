extends GunTemplate
class_name GunWide

@export var gun_wide_stats: GunWideStat

func is_ready_to_shoot() -> bool:
	if time_since_last_shot >= gun_wide_stats.fire_rate:
		return true
	else:
		return false

func shoot(delta) -> void:
	if is_ready_to_shoot():
		var angle_step: float = gun_wide_stats.spread_angle / (gun_wide_stats.nbr_bullets - 1) if gun_wide_stats.nbr_bullets > 1 else 0
		
		var start_angle: float = -gun_wide_stats.spread_angle / 2
		
		for i: int in range(gun_wide_stats.nbr_bullets):
			var bullet: Node2D = gun_wide_stats.bullet_scene.instantiate()
			
			var bullet_angle: float = deg_to_rad(start_angle + (i * angle_step))
			var final_angle: float = global_rotation + bullet_angle
			
			var bullet_transform: Transform2D = Transform2D(final_angle, global_position)
			bullet.global_transform = bullet_transform
			
			get_tree().root.add_child(bullet)
		
		has_fired()
