extends Node

var is_logging: bool = true
var is_logging_debug: bool = true
var is_logging_info: bool = true
var is_logging_warnings: bool = true
var is_logging_errors: bool = true

func debug(message: String) -> void:
	if not is_logging or not is_logging_debug:
		return
	print(_get_time() + "[DBG] " + message)

func info(message: String) -> void:
	if not is_logging or not is_logging_info:
		return
	print(_get_time() + "[INF] " + message)

func warn(message: String) -> void:
	if not is_logging or not is_logging_warnings:
		return
	print(_get_time() + "[WRN] " + message)

func error(message: String) -> void:
	if not is_logging or not is_logging_errors:
		return
	print(_get_time() + "[ERR] " + message)

func _get_time() -> String:
	var time: Dictionary = Time.get_datetime_dict_from_system()
	return "[%04d-%02d-%02d|%02d:%02d:%02d]" % [time.year, time.month, time.day, time.hour, time.minute, time.second]

func _ready() -> void:
	info("Started Logging...")
