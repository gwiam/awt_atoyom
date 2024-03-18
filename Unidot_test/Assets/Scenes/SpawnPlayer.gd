extends Node3D

var objPlayer : PackedScene = preload("res://Assets/Prefabs/NecessaryLevelObjects/player_fixed.prefab.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	objPlayer.resource_name = "ActivePlayer"
	var playerInstance = objPlayer.instantiate()
	playerInstance.position = global_position
	get_node("/root/RootNode3D").add_child.call_deferred(playerInstance)
