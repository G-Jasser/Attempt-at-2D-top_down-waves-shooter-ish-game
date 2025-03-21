extends Marker2D
class_name GunHolder

@onready var player: Player = get_parent()
var lock_mouse: bool = true

const MAX_GUNS: int = 3
var equipped_gun: GunTemplate
var guns: Array[GunTemplate] = []:
	set(new_value):
		guns = new_value
		if guns.size() > MAX_GUNS:
			guns.resize(MAX_GUNS)

func _enter_tree() -> void:
	for gun in get_children():
		if gun is GunTemplate:
			add_gun(gun)

func add_gun(gun: GunTemplate):
	guns.append(gun)

func _ready():
	if guns.size() > 0:
		equipped_gun = guns[0]


func _process(delta):
	mouse_locking()
	handle_gun_swapping()
	handle_gun_shooting(delta)


func handle_gun_shooting(delta) -> void:
	if equipped_gun:
		equipped_gun.track_time_since_last_shot(delta)
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			equipped_gun.shoot(delta)


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


func handle_gun_swapping() -> void:
	if Input.is_action_just_pressed("GUN_SWAP_UP"):
		swap_gun_up()
	if Input.is_action_just_pressed("GUN_SWAP_DOWN"):
		swap_gun_down()
	if Input.is_action_just_pressed("GUN_HOTKEY_1"):
		swap_gun_hotkey(0)
	if Input.is_action_just_pressed("GUN_HOTKEY_2"):
		swap_gun_hotkey(1)
	if Input.is_action_just_pressed("GUN_HOTKEY_3"):
		swap_gun_hotkey(2)


func swap_gun_up() -> void:
	if guns.size() <= 1:
		return
	
	var index: int = guns.find(equipped_gun)
	if index == -1:
		return
	
	index += 1
	if index >= guns.size():
		index = 0
	equipped_gun = guns[index]


func swap_gun_down() -> void:
	if guns.size() <= 1:
		return
		
	var index: int = guns.find(equipped_gun)
	if index == -1:
		return
	
	index -= 1
	if index < 0:
		index = guns.size() - 1
	equipped_gun = guns[index]


func swap_gun_hotkey(index: int) -> void:
	if index < 0 or index >= guns.size():
		return
	
	if equipped_gun == guns[index]:
		return
	
	equipped_gun = guns[index]
