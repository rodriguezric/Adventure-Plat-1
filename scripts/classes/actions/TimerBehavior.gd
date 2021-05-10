extends Node2D
class_name TimerBehavior

export (Resource) var bullet_resource
export var speed : int = 20
export var interval : int = 1
export(Directions.Enum) var direction = Directions.LEFT
export var bounce_off_wall : bool = false
export(Array, String, 
	"0", "wait", 
	"up", "down", "left", "right", 
	"face-left", "face-right", "reverse",
	"forward",
	"shoot",
	"die") var actions

var current_action : int = 0
var motion : Vector2
var parent: Node2D


func _ready() -> void:
	yield(get_tree(), "idle_frame")
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
			instance_bullet()
		'face-left':
			direction = Directions.LEFT
		'face-right':
			direction = Directions.RIGHT
		'reverse':
			if direction == Directions.RIGHT:
				direction = Directions.LEFT
			else:
				direction = Directions.RIGHT
		'forward':
			motion.x = speed * direction
		'jump':
			pass
		'die':
			parent.queue_free()


func _physics_process(delta: float) -> void:
	yield(get_tree(), "idle_frame")
	parent.move_local_x(delta * motion.x)
	parent.move_local_y(delta * motion.y)


func _on_Timer_timeout():
	next_action()
	process_action()

func instance_bullet():
	var move_behavior = load("res://scripts/classes/actions/MoveBehavior.gd").new()
	move_behavior.set_speed(100)
	move_behavior.set_direction(direction)

	var bullet = bullet_resource.instance()
	bullet.transform = transform
	bullet.add_child(move_behavior)
	var root_node = get_tree().root.get_child(0)
	bullet.connect("damage_player", parent.get_parent(), "_on_Hazzard_damage_player")
	

	get_parent().add_child(bullet)
