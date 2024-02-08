extends Node3D

var playerCurrentHealth
var gameOver = false
@export var playerMaxHealth = 100
@onready var GameOverCanvas = $"../GameOverCanvas"

func _ready():
	GameOverCanvas.visibile = false
	playerCurrentHealth = playerMaxHealth
	# pretty sure the scene changer is not needed

func _process(_delta):
	if gameOver && Input.is_action_just_pressed("restart"):
		get_tree().reload_scene()

func DamageToPlaye(damageQuantity):
	playerCurrentHealth -= damageQuantity
	if(playerCurrentHealth <= 0):
		DoGameOver()
		
func DoGameOver():
	# TODO set canPause of PauseGame to false
	var timeManager = $"../TimeManager"
	timeManager.queue_free()
	
	# original has time scale set to 0
	# I'd rather pause because I've heard bad things about setting time scale to 0
	# maybe do it just to see what happens
	Engine.time_scale = 0
	#get_tree().paused = true
	# TODO set the pitch of all unaffected audio to 1
	# TODO set the volume of all other audio to 0
	
	# TODO play gameover sound
	
	GameOverCanvas.visible = true
	
	gameOver = true
