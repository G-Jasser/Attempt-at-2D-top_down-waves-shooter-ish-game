extends Resource
class_name Stat

# TODO: Remove exports
@export var base_value: float = 0.0
var modified_value: float
var flat_modifier: float = 0.0

func _init(value: float):
	base_value = value
	flat_modifier = 0

func get_stat() -> float:
	modified_value = base_value + flat_modifier
	return modified_value

func modifiy_stat_by(flat_value: float) -> void:
	flat_modifier -= flat_value

func reset_stat() -> void:
	flat_modifier = 0
