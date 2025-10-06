extends Node
class_name GameRoot

const MAIN_MENU_SCENE: PackedScene = preload("res://scenes/main_menu/main_menu.tscn")
const GAME_WORLD_SCENE: PackedScene = preload("res://scenes/game_world/game_world.tscn")


func _ready() -> void:
	Linker.root = self
	main_menu()


func clear() -> void:
	for child in get_children():
		remove_child(child)
		child.queue_free()


func main_menu() -> void:
	clear()
	var menu: MainMenu = MAIN_MENU_SCENE.instantiate()
	var canvas: CanvasLayer = CanvasLayer.new()
	
	canvas.add_child(menu)
	add_child(canvas)

func game_world() -> void:
	clear()
	var world: GameWorld = GAME_WORLD_SCENE.instantiate()
	add_child(world)
