extends Node3D

var isPaused = false
var isSlowed = false
var canSlow = true
@export var abilityDelay = 1.25
@export var abilityDuration = 6.5
@export var slowFactor = 0.05
var timeLeft = 0
var timerForDelayOn
var timerForDurationOn
@onready var timerText = $"../Canvas/TimerText"

func _ready():
	# TODO init ChromaticAberration
	pass


func _process(delta):
	if(Input.is_action_just_pressed("slowmotion") && !isPaused):
		if isSlowed:
			EndSlowMotion()
		elif canSlow:
			DoSlowMotion()
	updateTimer(delta)
	

func EndSlowMotion():
	Engine.time_scale = 1
	# TODO change audio pitch
	isSlowed = false
	canSlow = false
	timerForDelayOn = true
	# TODO set timer text color to black
	# TODO play time continue sound
	# TODO deactivate chromatic aberration
	
	StartTimer(abilityDelay)

func DoSlowMotion():
	Engine.time_scale = slowFactor
	# TODO change audio pitch
	isSlowed = true
	timerForDurationOn = true
	# TODO set timer text color to white
	# TODO play slowmo sound
	# activate chromatic aberration
	
	StartTimer(abilityDuration)
	
	
func updateTimer(deltaTime):
	if(timeLeft > 0 && !isPaused):
		# https://github.com/godotengine/godot-proposals/issues/7775
		var unscaled = deltaTime if (Engine.time_scale == 0) else ((float)(deltaTime / Engine.time_scale))
		timeLeft -= unscaled
		if(timeLeft <= 0):
			if(timerForDelayOn):
				canSlow = true
				timerForDelayOn = false
			elif(timerForDurationOn):
				timerForDurationOn = false
				EndSlowMotion()
			timerText.text = ""
			return
		timerText.text = str(snapped(timeLeft,0.01))

func StartTimer(time):
	timeLeft = time
