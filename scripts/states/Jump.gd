extends State

var max_air_jumps: int = 1
var air_jumps: int

func enter(host:Player) -> void:
	host._handle_jump()
	host.animation_player.play("idle")



func update(host: Player, delta) -> void:
	host._handle_movement()
	host._handle_friction()
	host._handle_gravity(delta)
	
	if host.move.y > 0:
		emit_signal("change_state", "fall")
