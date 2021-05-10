extends Node2D

export var camera_left: int = 0 
export var camera_right: int = 0
export var camera_top: int = 0
export var camera_bottom: int = 0
export var area_name: String = ""

onready var player : Player = $Player
onready var dialog : DialogText = $UI/VB/M/BGP/HB/M/Dialog
onready var ui = {
	"hp": $UI/VB/M/BGP/HB/P/M/VB/HEALTH/value,
	"damage": $UI/VB/M/BGP/HB/P/M/VB/DAMAGE/value,
	"speed": $UI/VB/M/BGP/HB/P/M/VB/SPEED/value,
	"time": $UI/VB/M/BGP/HB/P/M/VB/TIME/value
}


func _ready() -> void:
	ui_update_hp()
	if area_name != "":
		dialog.show_dialogue([area_name])
	
	player.camera.limit_left = camera_left
	player.camera.limit_right = camera_right
	player.camera.limit_top = camera_top
	player.camera.limit_bottom = camera_bottom



func _on_Player_died() -> void:
	print("The player has died")
	player.kill()


func ui_update_hp() -> void:
	ui.hp.text = "X".repeat(player.health)


func _on_Player_health_changed() -> void:
	ui_update_hp()


func _on_Sign_send_message(_dialogue) -> void:
	dialog.show_dialogue(_dialogue)



func _on_Powerup_power_up(type: String) -> void:
	ui[type].text = String(GM.weapon[type].get_level())


func _on_Hazzard_damage_player(player: Player, amount: int) -> void:
	player.damage(amount)
	player.stun()


