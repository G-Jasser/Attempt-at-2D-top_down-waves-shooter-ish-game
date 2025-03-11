extends Marker2D

@export var enemy_scene: PackedScene
@export var spawn_timer: float = 10.0
@onready var timer: float = spawn_timer

func _process(delta):
	timer -= delta
	if timer <= 0:
		var enemy: Node2D = enemy_scene.instantiate()
		enemy.global_position = global_position
		get_tree().root.add_child(enemy)
		timer = spawn_timer
