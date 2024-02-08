extends Area3D

@onready var explodes = $"../DiesParticle/explodes"

func _on_body_entered(body):
	explodes.play()
	# TODO play particle effects
	# TODO delete particles afterwards (can probably be done inside of the particle system)
	# TODO tell enemy tracker that an enemy was killed
	
	print(body.name)
	
	body.queue_free()
