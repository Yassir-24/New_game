extends Area2D
class_name HurtboxComponent

@export var health_component: HealthComponent

func _on_area_entered(area: Area2D) -> void:
	var damage = 10
	if area.get_parent().is_in_group("Enemy"):
		if "damage" in area.get_parent():
			damage = area.get_parent().damage
		health_component.health = health_component.health - damage
