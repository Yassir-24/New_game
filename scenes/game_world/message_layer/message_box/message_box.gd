extends Control
class_name MessageBox

var text_finished: bool = false
const WORD_DELAY: float = 0.05
const MESSAGE_BOX = preload("uid://ce8vkq1t4ugnw")


var before: Callable
var after: Callable
var title: String
var message: String
var icon: Texture2D


@onready var background_ui: TextureRect = $Background
@onready var icon_ui: TextureRect = $Icon
@onready var title_ui: Label = $Title
@onready var message_ui: Label = $Message

func _ready() -> void:
	# Make message box run only when game is paused, rah get_tree().paused = true is called later
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	for child in get_children():
		child.process_mode = Node.PROCESS_MODE_WHEN_PAUSED


func open() -> void:
	# Won't be a case unless a message box awaits for a timer
	for child in Linker.msglayer.get_children():
		if child is MessageBox:
			return
	
	Linker.msglayer.darken()
	
	if before.is_valid():
		before.call()
	
	Linker.msglayer.add_child(self)
	get_tree().paused = true
	
	setup_visuals()
	await pullup()
	setup_text()

	if after.is_valid():
		after.call()

static func build(
	_title: String = "Title",
	_message: String = "This is a debug message, it should not show up in production. If this is shown then we messed up.",
	_icon: Texture2D = load("res://icon.svg"),
	_before: Callable = func() -> void: return,
	_after: Callable = func() -> void: return
	
) -> MessageBox:
	
	var box: MessageBox = MESSAGE_BOX.instantiate()
	box.title = _title
	box.message = _message
	box.icon = _icon
	box.before = _before
	box.after = _after
	return box



func pullup() -> Signal:
	var tween: Tween = get_tree().create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_property(background_ui, "modulate:a", 1, 0.1)
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_BOUNCE)
	return tween.finished


func close() -> void:
	get_tree().paused = false
	background_ui.modulate.a = 0
	icon_ui.modulate.a = 0
	title_ui.modulate.a = 0
	message_ui.modulate.a = 0
	Linker.msglayer.undarken()
	queue_free()


func setup_visuals() -> void:
	icon_ui.texture = icon
	title_ui.text = title

func setup_text() -> void:
	message_ui.text = ""
	message_ui.visible_characters = 0
	message_ui.visible_characters_behavior = TextServer.VC_CHARS_AFTER_SHAPING
	
	if message == null or message.is_empty():
		message_ui.text = "Hello, this is a test paragraph for the game. The game which is developed by Youssef and Yassir. This paragraph only serves as a placeholder to show how long we can make a text. The text should be readable and easy to understand and comprehend. Which is the main goal for this whole text box. It should also allow for fairely long strings of texts just in case we have a long monologue, but that's for another day."
	else:
		message_ui.text = message
	for letter in message_ui.text:
		if text_finished == true:
			break
		message_ui.visible_characters += 1
		await get_tree().create_timer(WORD_DELAY, true).timeout
	text_finished = true


func _on_background_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if text_finished:
			close()
		else:
			message_ui.visible_characters = -1
			text_finished = true
