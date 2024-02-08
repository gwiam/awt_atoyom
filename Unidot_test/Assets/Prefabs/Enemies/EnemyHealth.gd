extends Area3D

@onready var explodes = $"../DiesParticle/explodes"
@onready var leg_bot = $".."

func _on_body_entered(body):
	explodes.play()
	# TODO play particle effects
	# TODO delete particles afterwards (can probably be done inside of the particle system)
	# TODO tell enemy tracker that an enemy was killed
	
	# body is only the bullet
	await get_tree().create_timer(1).timeout
	
	leg_bot.queue_free()
