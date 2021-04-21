extends Area2D
class_name Door

signal entered

export var target_scene: String = ""


func _on_Door_body_entered(body: Player) -> void:
	if body is Player:
		get_tree().change_scene("res://scenes/"+target_scene+".tscn")
