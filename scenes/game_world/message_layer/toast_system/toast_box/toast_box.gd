extends VBoxContainer
class_name ToastBox

var toast_list: Array[Toast] = []

func _ready() -> void:
	pass

func add(toast: Toast) -> void:
	if toast_list.size() > 5:
		var first: Toast = toast_list.pop_front()
		if is_instance_valid(first):
			first.timer.stop()
			remove(first)
	
	
	toast_list.push_back(toast)
	add_child(toast)
	var timer: Timer = Timer.new()
	timer.wait_time = 10
	timer.one_shot = true
	toast.add_child(timer)
	toast.timer = timer
	timer.timeout.connect(func() -> void: remove(toast))
	timer.start()

func remove(toast: Toast) -> void:
	if not is_instance_valid(toast) or toast.is_queued_for_deletion():
		return
	
	toast_list.erase(toast)
	
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(toast, "modulate:a", 0, 0.3)
	await tween.finished
	
	if is_instance_valid(toast):
		remove_child(toast)
		toast.queue_free()
