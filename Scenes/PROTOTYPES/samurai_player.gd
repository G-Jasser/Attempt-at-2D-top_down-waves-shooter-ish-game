extends CharacterBody2D

@export var movement_speed: float = 200
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
var is_sword_shethed: bool = true
var is_attacking: bool = false

func _physics_process(delta: float) -> void:
	handle_movement()
	handle_weapon_shethe()
	handle_attack()
	handle_animation_tree()
	move_and_slide()

func handle_weapon_shethe() -> void:
	if not is_attacking and Input.is_action_just_pressed("shethe_weapon"):
		is_sword_shethed = not is_sword_shethed
func handle_attack() -> void:
	if not is_sword_shethed and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		is_attacking = true
func stop_attacking() -> void:
	is_attacking = false

func handle_movement():
	var movement_direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = movement_direction * movement_speed


func handle_animation_tree() -> void:
	animation_tree.set("parameters/conditions/shethe", is_sword_shethed)
	animation_tree.set("parameters/conditions/unshethe", not is_sword_shethed)
	animation_tree.set("parameters/conditions/attack", is_attacking)
	animation_tree.set("parameters/conditions/finish_attack", not is_attacking)
