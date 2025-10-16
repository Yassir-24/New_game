extends Area2D


var liste_interactables := []


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and liste_interactables.size() > 0:
		var pumpkin = liste_interactables[0]
		pumpkin.interact()


func _ready() -> void:
	area_entered.connect(_interactable_entered)
	area_exited.connect(_interactable_exited)



func _interactable_entered(area):
	if area is interactable:
		print("area added")
		liste_interactables.push_back(area)


func _interactable_exited(area):
	if area is interactable:
		liste_interactables.erase(area)
