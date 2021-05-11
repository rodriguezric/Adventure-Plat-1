extends TimerBehavior
class_name PaceBehavior

func _ready() -> void:
	actions = [
		['wait'], ['wait'], ['left'], 
		['wait'], ['wait'], ['right']
	]
	parent = get_parent()
