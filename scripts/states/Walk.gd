extends State


func update(host: Player, delta):
	host._handle_movement()
	host._handle_friction()
	
	if Input.is_action_pressed("jump"):
		emit_signal("change_state", "jump")
	
	if not host.is_on_floor():
		emit_signal("change_state", "fall")

	if host.move.x == 0:
		emit_signal("change_state", "idle")
