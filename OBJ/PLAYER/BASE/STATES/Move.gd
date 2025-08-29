@tool
extends BaseState




func _enter(data = {}):
	root.anim.speed_scale = 0.8
	root.anim.play("walk")
	pass


func _step():
	if root.velocity.x == 0 && root.velocity.z == 0:
		change_state("Idle")
	if root.velocity.y > 0:
		change_state("Jump")
	if root.velocity.y < 0:
		change_state("Fall")
	pass


func _exit(next_state):
	pass
