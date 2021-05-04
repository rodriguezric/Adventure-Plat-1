extends Node2D
class_name TimerBehavior

export var speed : int = 20
export var interval : int = 1
export(Array, String, "0", "wait", "up", "down", "left", "right") var actions
var current_action : int = 0
var motion : Vector2
var parent: Node2D



func _ready() -> void:
	print("I'm ready")
	parent = get_parent()
	initialize_timer()
	process_action()


func initialize_timer() -> void:
	var timer := Timer.new()
	add_child(timer)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start(interval)


func next_action() -> void:
	current_action = (current_action + 1) % len(actions)


func process_action() -> void:
	match actions[current_action]:
		'wait': 
			motion.x = 0
			motion.y = 0
		'up':
			motion.x = 0
			motion.y = -speed
		'down':
			motion.x = 0
			motion.y = speed
		'left':
			motion.x = -speed
			motion.y = 0
		'right':
			motion.x = speed
			motion.y = 0
		'shoot':
			pass


func _physics_process(delta: float) -> void:
	parent.move_local_x(delta * motion.x)
	parent.move_local_y(delta * motion.y)


func _on_Timer_timeout():
	next_action()
	process_action()
