class_name Player
extends CharacterBody3D

@onready var camera_3d:Camera3D = %Camera3D
@onready var head:Node3D = %head

@export var mouse_sen: float = 0.5
@export var max_jump_amount: int = 1
var jump_amount: int
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	jump_amount = max_jump_amount

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sen))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sen))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		jump_amount = max_jump_amount

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_amount > 0:
		velocity.y = JUMP_VELOCITY
		jump_amount -= 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
