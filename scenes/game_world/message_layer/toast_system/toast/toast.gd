extends Control
class_name Toast

@onready var label: Label = $Label
const TOAST = preload("uid://chpxmrs6wvq8x") # Toast scene

# TODO: Different type of toast per type of event

enum ToastType {INFO, WARNING, DANGER}

var type: int = 0
var message: String = "You just ate a pumpkin!"
var timer: Timer

func _ready() -> void:
	label.text = message
	Log.debug("Toast is ready: " + message)


static func cook(toast_type: ToastType, toast_message:String) -> Toast:
	var cooked: Toast = TOAST.instantiate()
	cooked.type = toast_type
	cooked.message = toast_message
	return cooked
