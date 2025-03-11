extends GunTemplate
class_name GunBasic

func shoot(delta):
	if is_ready_to_shoot():
		var bullet: Node2D = gun_stats.bullet_scene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.global_transform = global_transform
		has_fired()
	else:
		# TODO: Don't shoot
		pass
