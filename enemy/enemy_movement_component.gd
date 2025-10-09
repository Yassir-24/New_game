extends Node2D

@onready var target_area: Area2D = $"../TargetArea"
@onready var sprite_enemy_component: AnimatedSprite2D = $"../SpriteEnemyComponent"

#had l3iba dyal iyamat lbac yallah fhemtha hhhh distance between player(A) o enemy(B) hiya B-A
func _physics_process(delta: float) -> void:

	if target_area.allow_mvt == true:
		sprite_enemy_component.play("run_animation")
		get_parent().velocity = global_position.direction_to(Linker.player.position) * 100
		get_parent().move_and_slide()
