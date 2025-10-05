extends CharacterBody2D


@export var speed = 250

#the variable that taked the last direction input
var previous_direction

var enemy_list = []

#the child node containing animations currently run and idle
@onready var character_animations: AnimatedSprite2D = $Character_animations
@onready var hearts: Node2D = $Hearts
@onready var reset_button: Button = $"../reset_button"
@onready var weapon_area_2d: Area2D = $weapon_area2d2
@onready var object_area: Area2D = $"../Icon/object_area"

var stop_mvt_attack = false
#mouvement fuunction for the character so he can move using vectors
func mouvement():
	if !hearts.stop_mvt :
		var direction = Input.get_vector("left","right","up","down")
		mouvement_animation(direction)
		velocity = direction * speed
		move_and_slide()
	else:
		pass
#trying the heart loss function
func _input(event):
	if event.is_action_pressed("attack"):
		attack_animation()

#animation that will be played based on the mouvement direction
#it will take the direction variable in the mouvement fucntion as argument 
#the idle will be played in the direction of the last vector input we can make a new 
#variable that will take the last direction
func mouvement_animation(direction):
	match direction:
		Vector2.UP:
			character_animations.play("run_up")
			previous_direction = Vector2.UP
		Vector2.DOWN:
			character_animations.play("run_down")
			previous_direction = Vector2.DOWN
		Vector2.LEFT:
			character_animations.play("run_left")
			previous_direction = Vector2.LEFT
		Vector2.RIGHT:
			character_animations.play("run_right")
			previous_direction = Vector2.RIGHT
		_:
			if direction == Vector2.ZERO:
				match previous_direction:
					Vector2.UP:
						character_animations.play("idle_up")
					Vector2.DOWN:
						character_animations.play("idle_down")
					Vector2.LEFT:
						character_animations.play("idle_left")
					Vector2.RIGHT:
						character_animations.play("idle_right")
			else:
				pass

func attack_animation():
	stop_mvt_attack = true
	match previous_direction:
		Vector2.UP:
			weapon_area_2d.deal_damage(enemy_list[0])
			character_animations.play("attack_up")
			await character_animations.animation_finished
			stop_mvt_attack = false
		Vector2.DOWN:
			weapon_area_2d.deal_damage(enemy_list[0])
			character_animations.play("attack_down")
			await character_animations.animation_finished
			stop_mvt_attack = false
		Vector2.LEFT:
			weapon_area_2d.deal_damage(enemy_list[0])
			character_animations.play("attack_left")
			await character_animations.animation_finished
			stop_mvt_attack = false
		Vector2.RIGHT:
			weapon_area_2d.deal_damage(enemy_list[0])
			character_animations.play("attack_right")
			await character_animations.animation_finished
			stop_mvt_attack = false
		_:
			pass
	
#if character is hurt this function will be triggered
func character_damaged():
	hearts.animation_ordering_hp()

#pour les utiliser dans weapon area script
func add_enemy_list(enemy_area):
	enemy_list.push_back(enemy_area)
func delete_enemy_list(enemy_area):
	enemy_list.erase(enemy_area)

func _physics_process(delta):
	if !stop_mvt_attack :
		mouvement()
