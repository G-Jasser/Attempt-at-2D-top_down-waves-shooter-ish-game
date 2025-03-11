extends GunTemplate
class_name GunBasic

func _ready():
	gun_stats = GunStat.new()
	gun_stats.damage = Stat.new(1)
	gun_stats.knockback = Stat.new(0)
	gun_stats.fire_rate = Stat.new(0.5)
	gun_stats.bullet_scene = preload("res://Scenes/bullet.tscn")

func shoot(delta):
	if is_ready_to_shoot():
		var bullet: Node2D = gun_stats.bullet_scene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.global_transform = global_transform
		has_fired()
	else:
		# TODO: Don't shoot
		pass
