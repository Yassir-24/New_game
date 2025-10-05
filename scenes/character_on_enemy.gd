extends Area2D

@onready var hearts: Node2D = $"../Hearts"
@onready var enemy_area: Area2D = $"../../enemy_placeholder/enemy_area"
@onready var character: CharacterBody2D = $".."


func _ready() -> void:
	area_entered.connect(_on_enemy_entered)
	area_exited.connect(_on_enemy_exited)

func _on_enemy_entered(area):
	character.character_damaged()
	character.add_enemy_list(area)

func _on_enemy_exited(area):
	character.delete_enemy_list(area)
