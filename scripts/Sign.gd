extends Area2D
class_name Sign

signal send_message

export(Array, String) var dialogue


func _on_Sign_body_entered(body: Player) -> void:
	if body is Player:
		emit_signal("send_message", dialogue)
