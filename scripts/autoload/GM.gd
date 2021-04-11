extends Node

var bullets_live: int = 0
var gold: int = 0

var player = {
	"max_health": 3
}

var weapon = {
	"max": 1,
	"speed": 150,
	"time": 0.15,
	"damage": 1
}


func initialize() -> void:
	player = {
		"max_health": 3
	}
	
	weapon = {
		"max": 1,
		"speed": 200,
		"time": 0.1,
		"damage": 1
	}
