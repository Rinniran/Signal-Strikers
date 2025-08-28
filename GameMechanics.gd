extends Node


func create_hitbox(hitpos, lifetime, damage, knockback, hitscale, parent):
	var new_hitbox = preload("res://Hitbox.tscn")
	var hit = new_hitbox.instantiate()
	hit.position = hitpos
	hit.lifetime = lifetime
	hit.damage = damage
	hit.hitscale = hitscale
	hit.parent = parent
	hit.rotation.y = parent.rotation.y
	
	get_parent().add_child(hit)
