extends Node2D

export var speed : int = 25
export var interval : float = 1.5
export(Directions.Enum) var direction = Directions.RIGHT

onready var enemy = $Enemy
onready var behavior = $Enemy/TimerBehavior
var initialized : bool = false

func _physics_process(delta: float) -> void:
	if not initialized:
		initialized = true
		behavior.speed = speed
		behavior.interval = interval
		behavior.direction = direction


func _on_Hazzard_damage_player(player: Player, amount: int) -> void:
	player.damage(amount)
	player.stun()
