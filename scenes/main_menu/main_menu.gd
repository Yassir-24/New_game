extends Control
class_name MainMenu

func _ready() -> void:
	Log.debug("Ready function finished for: " + name)

func _on_start_button_button_down() -> void:
	Linker.root.game_world()


func _on_quit_button_button_down() -> void:
	get_tree().quit()
