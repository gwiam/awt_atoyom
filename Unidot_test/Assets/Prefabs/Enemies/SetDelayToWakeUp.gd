extends Node

const delayToWakeUp: float = 2
const haveTrigger = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if(!haveTrigger):
		SetScriptsActive()
	

func SetScriptsActive():
	var nodePath:NodePath = "../LegsBot"
	var node = get_node(nodePath) as WakeUpAndGo
	
	node.delayToWakeUp = delayToWakeUp
	node.SetWakingUp()
