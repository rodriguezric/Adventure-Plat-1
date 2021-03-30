extends Area2D


var speed: int = 250
var damage: int = 1
var shoot_direction: float = 0


func rotate_to_direction() -> void:
	rotate(shoot_direction)


func _physics_process(delta: float) -> void:
	move_local_x(delta * speed)


func _on_LifeTimer_timeout() -> void:
	#emit death signal
	queue_free()
