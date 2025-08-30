@tool
extends BaseState




func _enter(data = {}):
	root.GRAV_ENABLED = true
	root.MOVE_ENABLED = true
	root.anim.speed_scale = 0.8
	root.anim.play("walk")
	root.SPEED = root.REGSPEED
	pass


func _step():
	if root.velocity.x == 0 && root.velocity.z == 0:
		change_state("Idle")
	if root.velocity.y > 0:
		root.soundpl.stream = root.SNDJMP
		root.soundpl.stop()
		root.soundpl.play()
		change_state("Jump")
	if root.velocity.y < 0:
		change_state("Fall")
	
	if parent.state_time == 60:
		root.SPEED = root.DASHSPEED
		var FXDUST = preload("res://OBJ/VFXOBJECT/Dust.tscn")
		var dst = FXDUST.instantiate()
		dst.position = root.bk.position
		root.bk.get_parent().add_child(dst)
		root.anim.play("dash")
	pass


func _exit(next_state):
	pass
