extends Node

signal finished

func interact() -> void:
	finished.emit.call_deferred()
