extends Node2D

#ce script est initialement pour tout ce qui se chargera
@onready var reset_button: Button = $reset_button
@onready var hearts: Node2D = $CharacterBody2D/Hearts

func _ready() -> void:
	reset_button.visible = false
	reset_button.pressed.connect(reload_world)

#si le boutton reset est clique on reload le world
func reload_world():
	get_tree().reload_current_scene()
