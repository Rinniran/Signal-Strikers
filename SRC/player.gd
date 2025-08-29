extends CharacterBody3D


const SPEED = 13.0
const JUMP_VELOCITY = 6.5
@export var rotation_speed : float = TAU * 1.8
var _theta:float 

var facing_direction: Vector3 = Vector3.FORWARD
var facing_direction_3d: int = 1

var GRAV_ENABLED = true
var MOVE_ENABLED = true

@export var camera:Marker3D

@onready var mesh = $Mesh
@onready var anim = $Mesh/AnimationPlayer

func _ready() -> void:
	$StateMachine.initialize()


func direction_string_to_vector2(direction_string: String) -> Vector2:
	var vec: Vector2
	if direction_string == "left":
		vec = Vector2.LEFT
	if direction_string == "right":
		vec = Vector2.RIGHT
	if direction_string == "up":
		vec =  Vector2.UP
	if direction_string == "down":
		vec = Vector2.DOWN
	return vec.rotated(camera.rotation.y)
	assert(false, "Invalid direction")
	return Vector2.ZERO

func update_facing_direction():
	# Set the direction for the hitbox and attacks
	if !is_zero_approx(facing_direction.x):
		facing_direction_3d = sign(facing_direction.x)
	if !is_zero_approx(facing_direction.z):
		facing_direction_3d = sign(facing_direction.z)
func get_input_vector() -> Vector2:
	return Vector2(int(Input.get_axis("ui_left","ui_right")), int(Input.get_axis("ui_up","ui_down")))

func get_movement_vector() -> Vector2:
	return get_input_vector().rotated(-camera.rotation.y).normalized()

func _physics_process(delta: float) -> void:
	$StateMachine.advance()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_released("ui_accept") and velocity.y > 0:
		velocity.y = 0
		
	if Input.is_action_just_pressed("attack"):
		GameMechanics.create_hitbox(Vector3($FRONTOBJ.position.x,$FRONTOBJ.position.y,$FRONTOBJ.position.z + 2), 12, 2, 2, 3, $FRONTOBJ)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var acceleration_vector: Vector2
	var input_dir := get_input_vector()
	var direction := get_movement_vector()
	if direction:
		_theta = wrapf(atan2(-direction.x, -direction.y) - rotation.y, -PI, PI)
		rotation.y += clamp(rotation_speed * delta, 0, abs(_theta)) * sign(_theta)
		
		
		acceleration_vector = direction * SPEED
		
		#rotate(Vector3.FORWARD, _theta)
		#look_at(position + direction)
		velocity.x = acceleration_vector.x
		velocity.z = acceleration_vector.y

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	#rotation.y = velocity.x + velocity.z

	move_and_slide()
