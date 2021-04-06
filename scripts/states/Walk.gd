extends State


func enter(host: Player) -> void:
	host.animation_player.play("idle")


func update(host: Player, delta):
	host._handle_movement()
	host._handle_friction()
	host._handle_floor_touch()
	
	if Input.is_action_just_pressed("jump"):
		emit_signal("change_state", "jump")
	
	if not host.is_on_floor():
		emit_signal("change_state", "fall")

	if abs(host.move.x) <= 1:
		emit_signal("change_state", "idle")
