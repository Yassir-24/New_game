extends Control
class_name Toast

@onready var label: Label = $Label
const TOAST = preload("uid://chpxmrs6wvq8x") # Toast scene

# TODO: Different type of toast per type of event
const INFO: int = 0
const WARNING: int = 1
const DANGER: int = 2

var type: int = 0
var message: String = "You just ate a pumpkin!"
var timer: Timer
var function: Callable

func _ready() -> void:
	label.text = message
	if function.is_valid():
		function.call()
	Log.send(Log.DEBUG, "Toast is ready: " + message)


static func cook(toast_type: int, toast_message:String, toast_function: Callable = func() -> void: return) -> Toast:
	var cooked: Toast = TOAST.instantiate()
	cooked.function = toast_function
	cooked.type = toast_type
	cooked.message = toast_message
	return cooked
