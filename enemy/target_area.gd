extends Area2D

@onready var enemy_movement_component: Node2D = $"../EnemyMovementComponent"

var  allow_mvt := false
func _ready() -> void:
	area_entered.connect(following_player)
	area_exited.connect(stop_following_player)
	
func following_player(area):
	allow_mvt = true

func stop_following_player():
	allow_mvt = false
