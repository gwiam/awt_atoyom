extends Area3D

var HealthManager

func _ready():
	HealthManager = get_node("/root/RootNode3D/LevelMinimumPrefabs/HealthManager") as HealthManager

func _on_body_entered(body):
	HealthManager.DamageToPlayer(100)
