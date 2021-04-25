extends Node

var bullets_live: int = 0
var gold: int = 0

var player = {
	"max_health": 3
}

var weapon = {
	"max": BulletQuantity.new(),
	"speed": BulletSpeed.new(),
	"time": BulletTime.new(),
	"damage": BulletDamage.new()
}


func initialize() -> void:
	player = {
		"max_health": 3
	}


func power_up(key: String) -> void:
	weapon[key].level_up()
