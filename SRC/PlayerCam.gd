extends Marker3D

@export var target:Node
@export var player:Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = player.position.x
	position.z = player.position.z
	position.y = player.position.y + 1
	if target != null:
		_look_at_target_interpolated(.1)
	else:
		if Input.is_action_pressed("camleft"):
			rotation.y += .1
		if Input.is_action_pressed("camright"):
			rotation.y -= .1
		


func _look_at_target_interpolated(weight:float) -> void:
	var xform := transform # your transform
	xform = xform.looking_at(target.global_position,Vector3.UP)
	transform = transform.interpolate_with(xform,weight)
