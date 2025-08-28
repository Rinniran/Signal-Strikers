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
	position.y = player.position.y + 2
	if target != null:
		look_at(target.position)
