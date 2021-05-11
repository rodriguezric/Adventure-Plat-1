extends TimerBehavior
class_name MoveBehavior

func _ready() -> void:
	actions = [['forward']]
	parent = get_parent()


func set_direction(_direction: int) -> void:
	direction = _direction


func set_speed(_speed: int) -> void:
	speed = _speed
