### Two main interactable exist:
# Toast: a bottom right notification that appears, it is ran by adding it to the toast_box
# code for toast runs in its _ready()

# Messagebox: a stardew valley type of message box that appears and stops the game until is dealt with
# code for message box runs in open()

extends Area2D

enum Type {TOAST, MESSAGEBOX}

var message: MessageBox
var toast: Toast
var type: Type

func interact() -> void:
	Log.debug("Interaction happened.")
