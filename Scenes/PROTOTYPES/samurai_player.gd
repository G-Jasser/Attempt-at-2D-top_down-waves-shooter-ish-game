extends CharacterBody2D

@export var movement_speed: float = 200
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var is_sword_shethed: bool = true

func _physics_process(delta: float) -> void:
	handle_movement()
	if is_sword_shethed:
		animation_player.play("idle")
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			animation_player.play("unshethe")
	else: 
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			animation_player.play("attack_1")
		elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			animation_player.play_backwards("unshethe")
	move_and_slide()

func handle_movement():
	var movement_direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = movement_direction * movement_speed
