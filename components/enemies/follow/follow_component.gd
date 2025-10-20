extends Area2D
class_name EnemyFollowComponent

@export var movement: EnemyMovementComponent

func _on_area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		movement.is_chasing_player = true
		Log.debug("PLAYER ENTERED")


func _on_area_exited(area: Area2D) -> void:
	if area is HurtboxComponent:
		movement.is_chasing_player = false
		Log.debug("PLAYER EXITED")
