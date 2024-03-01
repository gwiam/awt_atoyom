extends Area3D

@onready var explodes = $"../DiesParticle/explodes"
@onready var gun_pivot = $"../LegsBot/Armature/Skeleton3D/Body/GunPivot"
@onready var legBot = $".."
@onready var legsBot = $"../LegsBot"
@onready var diesParticle = $"../DiesParticle"

func _on_body_entered(body):
	explodes.play()
	
	legBot.set_physics_process(false) 
	legsBot.visible = false
	gun_pivot.queue_free()
	diesParticle.set_emitting(true)

	var enemyTracker = $"/root/RootNode3D/LevelMinimumPrefabs/Door" as EnemyTracker
	enemyTracker.EnemyKilled()
	
	# body is only the bullet
	await get_tree().create_timer(1,false).timeout
	
	legBot.queue_free()
