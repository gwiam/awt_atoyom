extends Area3D


func _on_body_entered(body):
	if body.name == "player":
		# TODO change to next level
		# for now restarting level
		get_node("/root/player").queue_free()
		Engine.time_scale = 1
		get_tree().paused = false
		get_tree().reload_current_scene()
		
