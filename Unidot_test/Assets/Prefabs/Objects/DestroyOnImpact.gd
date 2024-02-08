extends RigidBody3D

func _ready():
	pass
	# collision monitoring done in inspector

func _on_body_entered(body):
	# TODO all the other stuff from the original
	queue_free()
	# pass
