extends KinematicBody2D
class_name Player

var health: int = 3

var move_speed: int = 250
var jump_force: int = -250
var friction: float = 0.5
var gravity: int = 500
var move: Vector2

var state_stack = []
var state_current = null
onready var state_map = {
	'idle': $States/Idle,
	'fall': $States/Fall,
	'jump': $States/Jump,
	'walk': $States/Walk
}

func _ready() -> void:
	enter_state('idle')
	

func _physics_process(delta: float) -> void:
	update_state(delta)
	move_and_slide(move, Vector2.UP)


func enter_state(state: String) -> void:
#	state_stack.push_back(state)
	state_current = state_map[state]
	state_current.enter(self)


func update_state(delta) -> void:
	if state_current == null:
		enter_state('idle')
	if state_current:
		state_current.update(self, delta)


func _handle_movement() -> void:
	if Input.is_action_pressed("move_left"):
		move.x = -move_speed
	
	if Input.is_action_pressed("move_right"):
		move.x = move_speed


func _handle_jump() -> void:
	move.y = jump_force


func _handle_gravity(delta) -> void:
	move.y += gravity * delta


func _handle_floor_touch() -> void:
	move.y = 0


func _handle_friction() -> void:
	move.x = lerp(move.x, 0, friction)


func is_alive() -> bool:
	return health > 0


func damage(amount: int) -> void:
	health = max(0, health - amount)
	if health == 0:
		# signal death
		pass

func kill() -> void:
	queue_free()
