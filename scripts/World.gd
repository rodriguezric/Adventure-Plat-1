extends Node2D


onready var player : Player = $Player
onready var dialog : DialogText = $UI/C/VB/M/BGP/HB/M/Dialog
onready var ui = {
	"hp": $UI/C/VB/M/BGP/HB/P/M/VB/HEALTH/value
}

func _ready() -> void:
	ui_update_hp()
	dialog.show_dialogue(["Hello", "Testing this one", "This is the final test."])


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
