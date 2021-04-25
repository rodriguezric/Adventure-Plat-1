extends Area2D
class_name Powerup

export(String, "max", "speed", "time", "damage") var type


func _on_Powerup_body_entered(body: Player) -> void:
	if body is Player:
		print(type)
		GM.power_up(type)
		queue_free()
