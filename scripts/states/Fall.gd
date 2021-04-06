extends State


func enter(host: Player) -> void:
	host.animation_player.play("idle")


func update(host: Player, delta) -> void:
	host._handle_movement()
	host._handle_friction()
	host._handle_gravity(delta)
	
	if host.is_on_floor():
		host._handle_floor_touch()
		emit_signal("change_state", "idle")
