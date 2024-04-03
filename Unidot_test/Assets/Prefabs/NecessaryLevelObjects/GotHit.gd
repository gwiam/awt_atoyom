extends Area3D

@onready var HealthManager = $"/root/RootNode3D/LevelMinimumPrefabs/HealthManager" as HealthManager

func _ready():
	pass

func _on_body_entered(body):
	# TODO only take damage with bullet
	print("Player collided with " + body.name)
	HealthManager.DamageToPlayer(100)
