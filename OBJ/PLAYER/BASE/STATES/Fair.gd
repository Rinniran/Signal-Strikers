@tool
extends BaseState




func _enter(data = {}):
	root.GRAV_ENABLED = true
	root.MOVE_ENABLED = true
	root.anim.speed_scale = 0.9
	root.anim.play("AirATK1")
	root.soundpl.stream = root.SNDATK1
	root.soundpl.stop()
	root.soundpl.play()
	pass


func _step():
	if root.is_on_floor():
		root.soundpl.stream = root.SNDLNDLT
		root.soundpl.stop()
		root.soundpl.play()
		change_state("Idle")
	if parent.state_time == 12:
		GameMechanics.create_hitbox(Vector3(root.fr.position.x,root.fr.position.y - 0.5,root.fr.position.z + 2.5), 12, 2, 2, 3, root.fr)
	if parent.state_time == 25:
		root.anim.speed_scale = 1.1
		root.anim.play("AirATK1_end")
	if parent.state_time >= 40:
		if root.velocity.y > 0:
			change_state("Jump")
		if root.velocity.y < 0:
			change_state("Fallcnt")
	pass


func _exit(next_state):
	pass
