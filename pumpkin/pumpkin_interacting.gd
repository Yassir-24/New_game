extends interactable


@onready var player: Player = $"../../Player"

var count = 0

func interact():
	print("i am a pumpkin")
	count += 1
	print(count)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
