extends Control



func _on_QuitButton_pressed() -> void:
	get_tree().quit()


func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://scenes/World.tscn")
