extends Node3D

const delayToWakeUp: float = 1
const haveTrigger = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("running")
	if(!haveTrigger):
		SetScriptsActive()
	

func SetScriptsActive():
	var nodePath:NodePath = "./LegsBot"
	var node = get_node(nodePath) as WakeUpAndGo
	
	node.delayToWakeUp = delayToWakeUp
	node.StartWakeUp()
