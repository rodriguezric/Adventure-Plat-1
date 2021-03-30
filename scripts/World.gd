extends Node2D


onready var dialog = $UI/CanvasLayer/VBoxContainer/Panel/Text
onready var player = $Player

func _ready() -> void:
	dialog.text = "Hello"


func _on_Area2D_body_entered(body: Node) -> void:
	if body is Player:
		body.damage(1)
		print(body.health)


func _on_Player_died() -> void:
	print("The player has died")
	player.kill()
