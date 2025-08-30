@tool
extends BaseState




func _enter(data = {}):
	root.anim.play("2")
	pass


func _step():
	if parent.state_time == 60:
		parent.change_state("1")
	pass


func _exit(next_state):
	pass
