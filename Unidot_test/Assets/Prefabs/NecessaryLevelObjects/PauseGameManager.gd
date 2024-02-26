extends Node3D

class_name PauseGame

var canPause
var isPaused = false # don't think I'll need this anymore
@onready var pauseGameCanvas = $"../PauseGameCanvas"

func _ready():
	canPause = true
	pauseGameCanvas.hide()


func _process(delta):
	if(Input.is_action_just_pressed("pause")): # only one check is necessary because you can map multiple buttons to one action
		TogglePause()

func TogglePause():
	isPaused = !isPaused
	
	# TODO set camera movement to paused
	# TODO set time manager to paused
	# TODO set hold and shoot to paused
	
	if isPaused:
		# TODO stop all audio
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
		get_tree().paused = true
		pauseGameCanvas.show() # had to move it here because you cannot set visibility with a bool
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		get_tree().paused = false
		pauseGameCanvas.hide()
