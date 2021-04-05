extends State


onready var timer = $Timer


func enter(host: Player) -> void:
	host.move.x *= -1
	host.move.y *= -0.5
	timer.start()


func _on_Timer_timeout() -> void:
	emit_signal("change_state")
