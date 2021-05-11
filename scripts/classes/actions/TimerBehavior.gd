extends Node2D
class_name TimerBehavior

export (Resource) var bullet_resource
export var speed : int = 20
export var interval : float = 1
export(Directions.Enum) var direction = Directions.LEFT
export var bounce_off_wall : bool = false
export(Array, Array, String, 
	"0", "wait", 
	"up", "down", "left", "right", 
	"face_left", "face_right", "reverse",
	"forward",
	"jump", "fall", "land",
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
	var _actions = actions[current_action]
	
	if typeof(_actions) == TYPE_ARRAY:
		for a in actions[current_action]:
			var f = funcref(self, a)
			f.call_func()
	else:
		var f = funcref(self, _actions)
		f.call_func()

func _physics_process(delta: float) -> void:
	yield(get_tree(), "idle_frame")
	parent.move_local_x(delta * motion.x)
	parent.move_local_y(delta * motion.y)


func _on_Timer_timeout():
	next_action()
	process_action()

func shoot():
	var move_behavior = load("res://scripts/classes/actions/MoveBehavior.gd").new()
	move_behavior.set_speed(100)
	move_behavior.set_direction(direction)

	var bullet = bullet_resource.instance()
	bullet.transform = transform
	bullet.add_child(move_behavior)
	var root_node = get_tree().root.get_child(0)
	bullet.connect("damage_player", parent.get_parent(), "_on_Hazzard_damage_player")
	

	get_parent().add_child(bullet)

func wait():
	motion.x = 0
	motion.y = 0

func reverse() -> void:
	if direction == Directions.RIGHT:
		direction = Directions.LEFT
	else:
		direction = Directions.RIGHT


func jump() -> void: motion.y  = -speed


func fall() -> void: motion.y = speed


func land() -> void: motion.y = 0


func die() -> void: queue_free()


func face_left() -> void: direction = Directions.LEFT


func face_right() -> void: direction = Directions.RIGHT


func forward() -> void: motion.x = speed * direction


func up() -> void:
	wait()
	jump()


func down() -> void:
	wait()
	fall()


func left() -> void:
	wait()
	face_left()
	forward()


func right() -> void:
	wait()
	face_right()
	forward()
