extends Area2D
class_name Hazzard

signal damage_player

export (int) var health: int = 1
export (int) var damage: int = 1
export (bool) var damageable: bool = true


func _on_Hazzard_body_entered(body: Node) -> void:
	if body is Player:
		print(body)
		emit_signal("damage_player", body, damage)


func _damage(amount: int) -> void:
	health -= amount
	if health <= 0: _kill()


func _kill() -> void:
	queue_free()


func _on_Hazzard_area_entered(area: Area2D) -> void:
	if area is Projectile:
		if damageable:
			_damage(area.damage)
