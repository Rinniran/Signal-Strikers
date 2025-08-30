@tool
extends BaseState




func _enter(data = {}):
	root.GRAV_ENABLED = true
	root.MOVE_ENABLED = true
	root.anim.speed_scale = 0.55
	root.anim.play("fall")
	pass


func _step():
	if root.is_on_floor():
		root.soundpl.stream = root.SNDLNDLT
		root.soundpl.stop()
		root.soundpl.play()
		change_state("Idle")
	
	if Input.is_action_just_pressed("attack"):
		change_state("Fair")
	pass


func _exit(next_state):
	pass
