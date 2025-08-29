extends Node


func create_hitbox(hitpos, lifetime, damage, knockback, hitscale, parent):
	var new_hitbox = preload("res://OBJ/Hitbox.tscn")
	var hit = new_hitbox.instantiate()
	
	
	hit.lifetime = lifetime
	hit.damage = damage
	hit.hitscale = hitscale
	hit.parent = parent
	hit.position = hitpos
	hit.rotation.y = parent.rotation.y
	
	parent.add_child(hit)
