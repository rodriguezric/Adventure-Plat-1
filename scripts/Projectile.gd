extends Area2D
class_name Projectile


onready var timer = $LifeTimer

var speed: int = 250
var damage: int = 1
var dir: int = Directions.RIGHT


func initialize_from_gm() -> void:
	GM.bullets_live += 1
	damage = GM.weapon.damage.get_value()
	speed = GM.weapon.speed.get_value()
	timer.start(GM.weapon.time.get_value())


func _physics_process(delta: float) -> void:
	move_local_x(delta * speed * dir)


func _on_LifeTimer_timeout() -> void:
	queue_free()

func _notification(type):
	if type == NOTIFICATION_PREDELETE:
		GM.bullets_live -= 1
