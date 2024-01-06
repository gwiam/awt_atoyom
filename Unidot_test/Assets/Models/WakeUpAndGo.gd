extends Node3D

class_name WakeUpAndGo
# TODO audio source
# TODO enemy navmesh
# TODO enemy shoot bullet

var delayToWakeUp: float = 0

func SetWakingUp():
	
	# TODO invoke function delayed by "delayToWakeUp"
	# TODO activate navmesh
	StartWakeUp()
	
func StartWakeUp():
	$AnimationPlayer2.play("legbotWalk2")
	
	var node = get_node("../CapsuleCollider/CollisionShape3D") as CollisionShape3D
	node.shape.height = 1.5
	node.position = Vector3.UP * 0.27
