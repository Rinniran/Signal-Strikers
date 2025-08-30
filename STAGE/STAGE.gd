extends Node3D

@export var match_started = false
@export var match_ended = false


@onready var state = $StateMachine
@onready var music = $Music
@onready var anim = $ANIM
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state.initialize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	state.advance()
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
