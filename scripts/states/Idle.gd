extends State


func _ready() -> void:
	pass # Replace with function body.


func enter(host: Player) -> void:
	host.animation_player.play("idle")


func update(host: Player, delta) -> void:
	host._handle_friction()
	host._handle_floor_touch()
	
	if Input.is_action_pressed("move_left"):
		emit_signal("change_state", "walk")
	
	if Input.is_action_pressed("move_right"):
		emit_signal("change_state", "walk")
	
	if Input.is_action_just_pressed("jump"):
		emit_signal("change_state", "jump")
	
	if not host.is_on_floor():
		emit_signal("change_state", "fall")
