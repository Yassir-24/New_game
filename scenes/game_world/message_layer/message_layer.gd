extends CanvasLayer
class_name MessageLayer

var bg: ColorRect

func _ready() -> void:
	Linker.msglayer = self
	_setup_bg()


func darken() -> void:
	if bg in get_children():
		return
	add_child(bg)

func undarken() -> void:
	if bg in get_children():
		remove_child(bg)

func _setup_bg() -> void:
	bg = ColorRect.new()
	bg.color = Color(0, 0, 0, 0.3)
	bg.anchor_bottom = 1
	bg.anchor_right = 1
	bg.offset_bottom = 0
	bg.offset_right = 0
	bg.z_index = -1
