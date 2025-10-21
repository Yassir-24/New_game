extends Node

signal finished
@export var type: Toast.ToastType
@export var message: String

func interact() -> void:
	Linker.toaster.add(type, message)
	finished.emit.call_deferred()
