extends Node2D
class_name GameWorld

func _ready() -> void:
	Linker.world = self
	Log.send(Log.DEBUG, "Ready function finished for: " + name)
