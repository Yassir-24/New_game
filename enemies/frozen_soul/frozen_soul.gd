extends Node2D
@onready var sprite_component: AnimatedSprite2D = $SpriteComponent

func _ready() -> void:
	sprite_component.play("idle")
