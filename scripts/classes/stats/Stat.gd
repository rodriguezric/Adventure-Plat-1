class_name Stat

const LEVEL_MAX := 5
const LEVEL_MIN := 1

# var base_value: float
# var modifier: float
var level: int = 1

func level_up() -> void:
	level = min(level + 1, LEVEL_MAX)


func level_down() -> void:
	level = max(level - 1, LEVEL_MIN)


func is_max_level() -> bool:
	return level == LEVEL_MAX


func is_min_level() -> bool:
	return level == LEVEL_MIN


func get_value() -> float:
	return get("base_value") + (level * get("modifier"))

func get_level() -> int:
	return level
