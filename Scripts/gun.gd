extends Marker2D
class_name GunHolder

@onready var player: Player = get_parent()
var lock_mouse: bool = true
@export var gun: GunTemplate

var bullet_scene = preload("res://Scenes/bullet.tscn")

func _process(delta):
	mouse_locking()
	gun.track_time_since_last_shot(delta)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		gun.shoot(delta)


func mouse_locking():
	if lock_mouse:
		display_cursor_off()
	else:
		display_cursor_on()
	if Input.is_action_just_pressed("escape"):
		lock_mouse = !lock_mouse


func display_cursor_off():
	lock_mouse = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	player.crosshair.global_position = get_global_mouse_position()


func display_cursor_on():
	lock_mouse = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
