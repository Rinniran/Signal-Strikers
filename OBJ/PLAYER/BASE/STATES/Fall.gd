@tool
extends BaseState




func _enter(data = {}):
	root.anim.speed_scale = 0.55
	root.anim.play("fall")
	pass


func _step():
	if root.is_on_floor():
		change_state("Idle")
	pass


func _exit(next_state):
	pass
