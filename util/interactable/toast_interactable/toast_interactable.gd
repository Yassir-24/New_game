extends Node

signal finished
@export var type: Toast.ToastType
@export var message: String

func interact() -> void:
	Linker.toaster.add(Toast.cook(type, message))
	emit_signal("finished")
