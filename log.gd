extends Node

var is_logging: bool = true
var is_logging_debug: bool = true
var is_logging_info: bool = true
var is_logging_warnings: bool = true
var is_logging_errors: bool = true

func send(type: Enums.LogType, message: String) -> void:
	if not is_logging:
		return
	var time: Dictionary = Time.get_datetime_dict_from_system()
	var timeformatted := "[%04d-%02d-%02d|%02d:%02d:%02d]" % [time.year, time.month, time.day, time.hour, time.minute, time.second]
	var typeformatted: String
	match type:
		Enums.LogType.DEBUG:
			if not is_logging_debug: return
			typeformatted = "[DBG]"
		Enums.LogType.INFO:
			if not is_logging_info: return
			typeformatted = "[INF]"
		Enums.LogType.WARNING:
			if not is_logging_warnings: return
			typeformatted = "[WRN]"
		Enums.LogType.ERROR:
			if not is_logging_errors: return
			typeformatted = "[ERR]"
		_: typeformatted = "[LOG]"
	print(timeformatted + typeformatted + " " + message)

func _ready() -> void:
	send(Enums.LogType.INFO, "Logging autoload is running")
