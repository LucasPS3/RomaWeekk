extends CharacterBody2D

# Variável para definir a velocidade de movimento do personagem
@export var MAX_SPEED: float = 80.0
@export var ACCELERATION: float = 500.0
@export var FRICTION:float = 500.0

@export var WATER_SPEED: float = 50.0
@export var NORMAL_SPEED: float = 80.0

var is_cutting:bool = false


var on_jump : bool = false
var target_direction : Vector2 = Vector2.RIGHT

@onready var collision_shape_2d = $CollisionShape2D
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
func _ready():
	#collision_shape_2d.disabled = true
	animationTree.active = true

func _physics_process(delta):
		# Vetor de movimento inicializado como (0, 0)
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("Rigth") -Input.get_action_strength("Left")
	input_vector.y = Input.get_action_strength("Down") -Input.get_action_strength("Up")
	input_vector = input_vector.normalized()
		
	if input_vector != Vector2.ZERO :

			#attack_vector = input_vector
			animationTree.set("parameters/Idle/blend_position",input_vector)
			animationTree.set("parameters/Run/blend_position",input_vector)
			#animationTree.set("parameters/Cut/blend_position",input_vector)
			animationState.travel("Run")
			velocity = velocity.move_toward(input_vector * MAX_SPEED,ACCELERATION * delta)
			# input_vector * max_speed = O que queremos obter gradualmente 
			#acceleration * delta = A velocidade em que iremos obter 
	else :
			animationState.travel("Idle")
			velocity = velocity.move_toward(Vector2.ZERO,FRICTION * delta)
			
		

		# Aplica o movimento ao CharacterBody2D
	move_and_slide()

		 
