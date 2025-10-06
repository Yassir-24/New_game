extends Area2D
class_name HurtboxComponent

func _on_area_entered(area: Area2D) -> void:
	var damage = 10
	if area.get_parent().is_in_group("Enemy"):
		if "damage" in area.get_parent():
			damage = area.get_parent().damage
		Linker.hud.player_health.health = Linker.hud.player_health.health - damage
