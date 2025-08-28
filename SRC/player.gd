extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var rotation_speed : float = TAU * 2
var _theta:float 


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_released("ui_accept") and velocity.y > 0:
		velocity.y = 0
		
	if Input.is_action_just_pressed("attack"):
		GameMechanics.create_hitbox(Vector3(position.x,position.y,position.z - 2), 12, 2, 2, 3, self)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		_theta = wrapf(atan2(-direction.x, -direction.z) - rotation.y, -PI, PI)
		rotation.y += clamp(rotation_speed * delta, 0, abs(_theta)) * sign(_theta)
		#look_at(position + direction)
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	#rotation.y = velocity.x + velocity.z

	move_and_slide()
