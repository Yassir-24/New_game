extends Control
class_name MessageBox

var interactable: Interactable
var text_finished: bool = false
const WORD_DELAY: float = 0.05

@onready var background: TextureRect = $Background
@onready var icon: TextureRect = $Icon
@onready var title: Label = $Title
@onready var message: Label = $Message


func _ready() -> void:
	#await get_tree().create_timer(1).timeout
	interactable = Interactable.new()
	if interactable.before.is_valid():
		interactable.before.call()
	
	setup_visuals()
	await open()
	setup_text()

	if interactable.after.is_valid():
		interactable.after.call()



func open() -> Signal:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(background, "modulate:a", 1, 0.1)
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_BOUNCE)
	return tween.finished

func close() -> void:
	background.modulate.a = 0
	icon.modulate.a = 0
	title.modulate.a = 0
	message.modulate.a = 0
	queue_free()



func setup_visuals() -> void:
	# Icon
	if interactable.icon == null:
		icon.texture = load("res://icon.svg")
	else:
		icon.texture = interactable.icon
	
	# Title
	if interactable.title == null or interactable.title.is_empty():
		title.text = "Title"
	else:
		title.text = interactable.title

func setup_text() -> void:
	message.text = ""
	message.visible_characters = 0
	message.visible_characters_behavior = TextServer.VC_CHARS_AFTER_SHAPING
	
	if interactable.message == null or interactable.message.is_empty():
		message.text = "Hello, this is a test paragraph for the game. The game which is developed by Youssef and Yassir. This paragraph only serves as a placeholder to show how long we can make a text. The text should be readable and easy to understand and comprehend. Which is the main goal for this whole text box. It should also allow for fairely long strings of texts just in case we have a long monologue, but that's for another day."
	else:
		message.text = interactable.message
	for letter in message.text:
		if text_finished == true:
			break
		message.visible_characters += 1
		await get_tree().create_timer(WORD_DELAY).timeout
	text_finished = true


func _on_background_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if text_finished:
			close()
		else:
			message.visible_characters = -1
			text_finished = true
