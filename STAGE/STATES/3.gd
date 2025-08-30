@tool
extends BaseState




func _enter(data = {}):
	print_debug("Hello?")
	root.anim.play("3")
	pass


func _step():
	print_debug(parent.state_time)
	if parent.state_time == 60:
		
		parent.change_state("2")
	pass


func _exit(next_state):
	pass
