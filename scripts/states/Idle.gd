extends State


func _ready() -> void:
	pass # Replace with function body.


func update(host: Player, delta) -> void:
	host._handle_friction()
	
	if Input.is_action_pressed("move_left"):
		emit_signal("change_state", "walk")
	
	if Input.is_action_pressed("move_right"):
		emit_signal("change_state", "walk")
	
	if Input.is_action_pressed("jump"):
		emit_signal("change_state", "jump")
	
	if not host.is_on_floor():
		emit_signal("change_state", "fall")
