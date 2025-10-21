extends Node

var is_logging: bool = true
var is_logging_debug: bool = true
var is_logging_info: bool = true
var is_logging_warnings: bool = true
var is_logging_errors: bool = true

func debug(message: Variant) -> void:
	if not is_logging or not is_logging_debug:
		return
	print(_get_time() + "[DBG] " + str(message))

func info(message: Variant) -> void:
	if not is_logging or not is_logging_info:
		return
	print(_get_time() + "[INF] " + str(message))

func warn(message: Variant) -> void:
	if not is_logging or not is_logging_warnings:
		return
	print(_get_time() + "[WRN] " + str(message))

func error(message: Variant) -> void:
	if not is_logging or not is_logging_errors:
		return
	print(_get_time() + "[ERR] " + str(message))

func _get_time() -> String:
	var time: Dictionary = Time.get_datetime_dict_from_system()
	return "[%04d-%02d-%02d|%02d:%02d:%02d]" % [time.year, time.month, time.day, time.hour, time.minute, time.second]

func _ready() -> void:
	info("Started Logging...")
