extends Node3D

var objPlayer : PackedScene = preload("res://Assets/Prefabs/NecessaryLevelObjects/player.prefab.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	objPlayer.resource_name = "ActivePlayer"
	var playerInstance = objPlayer.instantiate()
	add_child(playerInstance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
