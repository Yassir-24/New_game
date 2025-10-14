extends Node

const INFO: int = 0
const DEBUG: int = 1
const WARNING: int = 2
const ERROR: int = 3

var is_logging: bool = true
var is_logging_debug: bool = true
var is_logging_info: bool = true
var is_logging_warnings: bool = true
var is_logging_errors: bool = true

func send(type: int, message: String) -> void:
	if not is_logging:
		return
	var time: Dictionary = Time.get_datetime_dict_from_system()
	var timeformatted := "[%04d-%02d-%02d|%02d:%02d:%02d]" % [time.year, time.month, time.day, time.hour, time.minute, time.second]
	var typeformatted: String
	match type:
		INFO:
			if not is_logging_info: return
			typeformatted = "[INF]"
		DEBUG:
			if not is_logging_debug: return
			typeformatted = "[DBG]"
		WARNING:
			if not is_logging_warnings: return
			typeformatted = "[WRN]"
		ERROR:
			if not is_logging_errors: return
			typeformatted = "[ERR]"
		_: typeformatted = "[LOG]"
	print(timeformatted + typeformatted + " " + message)

func _ready() -> void:
	send(INFO, "Started Logging...")
