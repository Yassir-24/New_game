extends Node2D


#this script is for managing the hearts so each one we play loss animation
#or recover animation based on if the one before play the animation before hand
@onready var heart_1: AnimatedSprite2D = $heart_1
@onready var heart_2: AnimatedSprite2D = $heart_2
@onready var heart_3: AnimatedSprite2D = $heart_3
@onready var reset_button: Button = $"../../reset_button"


#this variable will be used in both animation_ordering_hp() and gain_heart()
var heart_count = 0
#stop mvt is used to stop the mouvemnt in the character script when hearts are out ( heat_count = 2)
var stop_mvt = false



#this function is not needed for now + the paths are wrong
func animation_ordering_hp():
	if heart_count == 0:
		heart_3.play("hp_loss")
		heart_count += 1
	elif heart_count == 1:
		heart_2.play("hp_loss")
		heart_count += 1
	elif heart_count == 2:
		heart_1.play("hp_loss")
		heart_count += 1
		await heart_1.animation_finished
		reset_button.visible = true
		stop_mvt = reset_button.visible
	if heart_count == 3 and reset_button.toggled:
		reset_hearts()
		heart_count = 0
		await reset_hearts()

#function for if the charactere has no hearts for now it will reset the hearts
func reset_hearts():
	heart_1.play("hp_recovery")
	await heart_1.animation_finished
	heart_2.play("hp_recovery")
	await heart_2.animation_finished
	heart_3.play("hp_recovery")

#if player gains hp by drinking potion or smth
func gain_heart():
	match heart_count:
		0:
			heart_1.play("hp_recovery")
		1:
			heart_1.play("hp_recovery")
		2:
			heart_1.play("hp_recovery")
