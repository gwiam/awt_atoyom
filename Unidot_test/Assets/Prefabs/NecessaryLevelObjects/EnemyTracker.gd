extends Node3D

class_name EnemyTracker

@export var enemyQuantity = 1
var kills = 0
@onready var animation_tree = $AnimationTree

# Called when the node enters the scene tree for the first time.
func _ready():
	if kills >= enemyQuantity:
		OpenDoor()


func EnemyKilled():
	kills += 1
	if kills >= enemyQuantity:
		OpenDoor()
	
func OpenDoor():
	animation_tree.changeStateOpen()
