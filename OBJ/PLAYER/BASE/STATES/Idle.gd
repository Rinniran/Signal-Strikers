@tool
extends BaseState




func _enter(data = {}):
	root.anim.speed_scale = 0.55
	root.anim.play("idle")
	pass


func _step():
	if root.velocity.x != 0 || root.velocity.z != 0:
		change_state("Move")
	if root.velocity.y > 0:
		change_state("Jump")
	if root.velocity.y < 0:
		change_state("Fall")
	pass


func _exit(next_state):
	pass
