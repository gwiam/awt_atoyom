extends Node3D

class_name WakeUpAndGo
# TODO audio source
# TODO enemy shoot bullet

signal enable_navmesh

var delayToWakeUp: float = 0
var animationDuration: float = 2.2

var awake = false

func SetWakingUp():
	var timer:Timer = $"../Timer"
	timer.start(delayToWakeUp)
	
func _on_timer_timeout():
	if !awake: 
		StartWakeUp()
		var timer:Timer = $"../Timer"
		timer.start(animationDuration)
	else:
		TurnNavMeshAndGunOn()

func TurnNavMeshAndGunOn():
	# TODO activate gun
	print("turning on navmesh")
	emit_signal("enable_navmesh")
	
func StartWakeUp():
	print("waking up bot")
	awake = true
	var stateMachine = $AnimationTree.get("parameters/Base Layer/playback")
	stateMachine.travel("WakeUp")
	var node = get_node("../CollisionShape3D") as CollisionShape3D
	node.shape.height = 1.5
	node.position = Vector3.UP * 0.27


