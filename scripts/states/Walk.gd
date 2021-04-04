extends State


func update(host: Player, delta):
	host._handle_movement()
	host._handle_friction()
	host._handle_floor_touch()
	
	if Input.is_action_just_pressed("jump"):
		emit_signal("change_state", "jump")
	
	if not host.is_on_floor():
		print("FALL!")
		emit_signal("change_state", "fall")

	if host.move.x == 0:
		emit_signal("change_state", "idle")
