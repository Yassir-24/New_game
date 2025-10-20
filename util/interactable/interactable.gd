### Two main interactable exist:
# Toast: a bottom right notification that appears, it is ran by adding it to the toast_box
# code for toast runs in its _ready()

# Messagebox: a stardew valley type of message box that appears and stops the game until is dealt with
# code for message box runs in open()

extends Area2D
class_name Interactable
var interactables: Array = []

func _ready() -> void:
	for child in get_children():
		interactables.push_back(child)


func interact() -> void:
	for interactable: Node in interactables:
		if interactable.has_method("interact"):
			Log.debug("BEFORE")
			interactable.interact()
			await interactable.finished
			Log.debug("AFTER")
			


#func _on_area_entered(area: Area2D) -> void:
	#if area is InteractArea and area.monitoring:
		#Log.debug("INTERACTION")
		#interact()
