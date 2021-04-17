extends Control

onready var start_button = $VSplitContainer/CenterContainer2/VBoxContainer/StartButton


func _ready() -> void:
	start_button.grab_focus()


func _on_QuitButton_pressed() -> void:
	get_tree().quit()


func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://scenes/World.tscn")
