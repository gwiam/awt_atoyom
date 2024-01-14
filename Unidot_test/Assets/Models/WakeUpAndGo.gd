extends Node3D

class_name WakeUpAndGo
# TODO audio source
# TODO enemy shoot bullet

signal enable_navmesh

var delayToWakeUp: float = 0

func SetWakingUp():
	var timer:Timer = $"../Timer"
	timer.start(delayToWakeUp)
	
func _on_timer_timeout():
	StartWakeUp()
	TurnNavMeshAndGunOn()

func TurnNavMeshAndGunOn():
	# TODO activate gun
	print("turning on navmesh")
	emit_signal("enable_navmesh")
	
func StartWakeUp():
	#$AnimationTree.play("WakeUp")
	print("waking up bot")
	$AnimationPlayer2.play("wakeUp")
	var node = get_node("../CollisionShape3D") as CollisionShape3D
	node.shape.height = 1.5
	node.position = Vector3.UP * 0.27


