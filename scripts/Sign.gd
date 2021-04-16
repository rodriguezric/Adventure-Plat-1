extends Area2D


signal send_message

export(Array, String) var dialogue


func _on_Sign_body_entered(body: Node) -> void:
	if body is Player:
		emit_signal("send_message", dialogue)
