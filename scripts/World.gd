extends Node2D

export var camera_limit_left: int
export var camera_limit_right: int

onready var player : Player = $Player
onready var dialog : DialogText = $UI/C/VB/M/BGP/HB/M/Dialog
onready var ui = {
	"hp": $UI/C/VB/M/BGP/HB/P/M/VB/HEALTH/value
}

func _ready() -> void:
	ui_update_hp()
	dialog.show_dialogue(["The Town"])
	player.camera.limit_left = camera_limit_left
	player.camera.limit_right = camera_limit_right


func _on_Area2D_body_entered(body: Node) -> void:
	if body is Player:
		body.stun()
		body.damage(1)
		print(body.health)


func _on_Player_died() -> void:
	print("The player has died")
	player.kill()


func ui_update_hp() -> void:
	ui.hp.text = "X".repeat(player.health)


func _on_Player_health_changed() -> void:
	ui_update_hp()


func _on_Sign_send_message(_dialogue) -> void:
	dialog.show_dialogue(_dialogue)

