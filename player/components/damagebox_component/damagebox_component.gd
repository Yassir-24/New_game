extends Area2D

@onready var attack_component: PlayerAttackComponent = $"../AttackComponent"

var enemy_range : bool = false
var enemy_area

func _ready() -> void:
	area_entered.connect(enemy_damaged)
	attack_component.deal_damage.connect(deal_damage_func)

#had l function 4adi ne7tajouha mn be3d 3la 9bel ennemy ai
func enemy_damaged(area):
	if area.name == "Area2D":
		enemy_area = area

func deal_damage_func():
	if enemy_area in get_overlapping_areas() :
		print("enemy damaged")
