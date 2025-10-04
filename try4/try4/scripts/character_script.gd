extends CharacterBody2D

#pour controler les animations dans mvt
@onready var character_animations: AnimatedSprite2D = $character_animations

#pour les controler dans la func bubble_visibility
@onready var character_panel: Panel = $Panel
@onready var character_label: Label = $Panel/Label

#pour les coeurs si le charactére est damagée
@onready var heart_lp_1: AnimatedSprite2D = $"../heart_LP1"
@onready var heart_lp_2: AnimatedSprite2D = $"../heart_LP2"
@onready var heart_lp_3: AnimatedSprite2D = $"../heart_LP3"

#variable de vitesse dans mvt
var speed = 250
#position ou il regarde pour que le idle se joue dans le meme sens
var looking_position = 0
#variable pour quand le joueur clique sur f il apparait et disapparait le text
var boolean = false

#pour checker si le charactére est touché
var damaged = false
#le coeur dont l'animation a été jouée
var no_anim_coeur = 0
#pour quel les coeurs apparaissent a nouveau
var reset_coeur = false



func _ready():
	bubble_visibility(false)
	heart_anim_reset()
	heart_lp_3.connect("animation_finished",heart_anim_reset())

func mouvement():

	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed

	if direction == Vector2(1,0):
		character_animations.play("run_right")
		looking_position = 1
	elif direction == Vector2(-1,0):
		character_animations.play("run_left")
		looking_position = -1
	elif direction == Vector2(0,-1):
		character_animations.play("run_up")
		looking_position = 2
	elif direction == Vector2(0,1):
		looking_position = -2
		character_animations.play("run_down")
	elif direction == Vector2.ZERO:

		if looking_position == -2:
			character_animations.play("idle_down")
		elif looking_position == 2:
			character_animations.play("idle_up")
		elif looking_position == -1:
			character_animations.play("idle_left")
		elif looking_position == 1:
			character_animations.play("idle_right")

#need to fix label
####### deux fonctions pour changer la visibilete du panel et label #######

#label and panel control
func bubble_visibility(show):
	
	character_animations.play("idle_down")
	character_panel.visible = show
	character_label.visible = show
	#to display the next text in character_thoughts func

#changer le true to false ou l inverse pour le label
func change_boolean():
	boolean = !boolean

############################################################################

func hearts_animation_loss():
	if no_anim_coeur == 0:
		heart_lp_3.play("heart_loss")
		no_anim_coeur +=1
	elif no_anim_coeur == 1:
		heart_lp_2.play("heart_loss")
		no_anim_coeur +=1
	elif  no_anim_coeur == 2:
		heart_lp_1.play("heart_loss")
	elif no_anim_coeur == 3:
		no_anim_coeur = 0
		#reset_coeur = true
		#heart_anim_reset()

func heart_anim_reset():

	heart_lp_3.play("hearts_reset")
	heart_lp_2.play("hearts_reset")
	heart_lp_1.play("hearts_reset")
	bubble_visibility(false)
	
	
func character_damaged():
	if damaged == true:
		hearts_animation_loss()
		if heart_lp_1.is_playing() :
			bubble_visibility(true)
			character_label.text = "Ouch!"

func _physics_process(delta):
	
	if Input.is_action_just_pressed("interact_with_self"):
		change_boolean()
		bubble_visibility(boolean)
	if !character_label.visible :
		mouvement()
	#replace it with enemy
	if Input.is_action_just_pressed("temporary"):
		damaged = true
		character_damaged()
