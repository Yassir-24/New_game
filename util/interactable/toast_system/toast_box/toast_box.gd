extends VBoxContainer
class_name ToastBox

var toast_list: Array[Toast]

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	add(Toast.cook(1, "HOLA 1"))
	await get_tree().create_timer(1).timeout
	add(Toast.cook(1, "HOLA 2"))
	await get_tree().create_timer(1).timeout
	add(Toast.cook(1, "HOLA 3"))
	await get_tree().create_timer(1).timeout
	add(Toast.cook(1, "HOLA 4"))

func add(toast: Toast) -> void:
	toast_list.push_front(toast)
	add_child(toast)
