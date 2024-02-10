extends Area3D

@onready var explodes = $"../DiesParticle/explodes"
@onready var legsBot = $"../LegsBot"
@onready var legBot = $".."
@onready var diesParticle = $"../DiesParticle"

func _on_body_entered(body):
	explodes.play()
	legsBot.visible = false
	diesParticle.set_emitting(true)
	# TODO delete particles afterwards (can probably be done inside of the particle system)
	# TODO tell enemy tracker that an enemy was killed
	
	# body is only the bullet
	await get_tree().create_timer(1).timeout
	
	legBot.queue_free()
