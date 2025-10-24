extends Node

signal finished

func interact() -> void:
	owner.queue_free()
	finished.emit.call_deferred()
