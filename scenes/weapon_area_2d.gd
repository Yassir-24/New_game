extends Area2D
@onready var character: CharacterBody2D = $".."
@onready var enemy_area: Area2D = $enemy_placeholder/enemy_area



func deal_damage(enemy):
	#l'enemy n'existe encore pas ici il va recevoir du damage
	if enemy.name == "enemy_area":
		print("you damaged the enemy")
	
	else:
		print("its an object")
