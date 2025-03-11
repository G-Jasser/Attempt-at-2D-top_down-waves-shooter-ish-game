extends Area2D
class_name Bullet

@export var speed: int = 400

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body):
	self_destroy()

func self_destroy() -> void:
	# TODO: Play VFX hit effect
	queue_free()
