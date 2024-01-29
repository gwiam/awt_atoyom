extends RigidBody3D

func _ready():
	contact_monitor = true
	max_contacts_reported = 1

func _on_body_entered(body):
	# TODO all the other stuff from the original
	queue_free()
