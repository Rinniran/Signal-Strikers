@tool
extends BaseState




func _enter(data = {}):
	root.anim.play("GO")
	pass


func _step():
	if parent.state_time == 60:
		root.match_started = true
		root.music.play()
	pass


func _exit(next_state):
	pass
