extends CanvasLayer
class_name HUD

@onready var player_health: PlayerHealth = $PlayerHealth

func _ready() -> void:
	Linker.hud = self
