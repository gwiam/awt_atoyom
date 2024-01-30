extends Node3D

class_name WakeUpAndGo
# TODO audio source

signal enable_navmesh
signal enable_gun

var delayToWakeUp: float = 0
const animationDuration: float = 1.0 # different from Unity

var awake = false
@onready var wakeUpBeep = $"../Audio/wakeUpBeep"

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
	print("turning on navmesh and gun")
	emit_signal("enable_navmesh")
	emit_signal("enable_gun")
	
func StartWakeUp():
	print("waking up bot")
	awake = true
	var stateMachine = $AnimationTree.get("parameters/Base Layer/playback")
	stateMachine.travel("WakeUp")
	wakeUpBeep.play()
	var node = get_node("../CollisionShape3D") as CollisionShape3D
	node.shape.height = 1.5
	node.position = Vector3.UP * 0.27


