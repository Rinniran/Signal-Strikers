@tool
extends BaseState




func _enter(data = {}):
	root.anim.play("1")
	pass


func _step():
	if parent.state_time == 60:
		parent.change_state("GO")
	pass


func _exit(next_state):
	pass
