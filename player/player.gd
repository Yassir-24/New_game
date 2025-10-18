extends CharacterBody2D
class_name Player

func _ready() -> void:
	Linker.player = self
	z_index = 1
	Log.debug("Ready function finished for: " + name)
