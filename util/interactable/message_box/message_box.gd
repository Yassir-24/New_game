extends Control
class_name MessageBox

var interactable: Interactable

@onready var msgbox: TextureRect = $TextureRect


func _ready() -> void:
	interactable = Interactable.new()
	if interactable.before.is_valid():
		interactable.before.call()

	pullup()

	if interactable.after.is_valid():
		interactable.after.call()



func pullup() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(msgbox, "modulate:a", 1, 0.1)
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_BOUNCE)

func pulldown() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(msgbox, "modulate:a", 0, 0.1)
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_BOUNCE)



func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		pulldown()
