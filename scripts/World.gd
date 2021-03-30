extends Node2D


onready var dialog = $UI/CanvasLayer/VBoxContainer/Panel/Text

func _ready() -> void:
	dialog.text = "Hello"
