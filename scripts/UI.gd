tool
extends CanvasLayer

export (bool) var visible: bool = true
onready var VB = $VB

func _process(delta: float) -> void:
	$VB.visible = visible
