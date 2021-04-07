extends Area2D


onready var timer = $LifeTimer

var speed: int = 250
var damage: int = 1
var dir: int = Directions.RIGHT


func initialize_from_gm() -> void:
	GM.bullets_live += 1
	damage = GM.weapon.damage
	speed = GM.weapon.speed
	timer.start(GM.weapon.time)


func _physics_process(delta: float) -> void:
	move_local_x(delta * speed * dir)


func _on_LifeTimer_timeout() -> void:
	queue_free()

func _notification(type):
	if type == NOTIFICATION_PREDELETE:
		GM.bullets_live -= 1
