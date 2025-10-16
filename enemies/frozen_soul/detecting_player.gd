extends Area2D


@onready var frozen_soul: CharacterBody2D = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_player_entered)
	body_exited.connect(_player_exited)



func _player_entered(player):
	if player == Linker.player:
		get_parent().start_following = true



func _player_exited(player):
	if player == Linker.player:
		get_parent().start_following = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
