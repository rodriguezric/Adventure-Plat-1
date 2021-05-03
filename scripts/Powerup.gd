extends Area2D
class_name Powerup

signal power_up

export(String, "speed", "time", "damage") var type


func _on_Powerup_body_entered(body: Player) -> void:
	if body is Player:
		GM.power_up(type)
		emit_signal("power_up", type)
		queue_free()
