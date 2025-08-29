@tool
extends BaseState




func _enter(data = {}):
	root.anim.speed_scale = 0.55
	root.anim.play("jump")


func _step():
	if root.velocity.y < 0:
		change_state("Fall")
	if parent.state_time > 12 && root.is_on_floor():
		change_state("Idle")
	pass


func _exit(next_state):
	pass
