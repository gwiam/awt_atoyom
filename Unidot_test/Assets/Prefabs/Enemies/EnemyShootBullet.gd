extends Node3D

var playerBodyTarget
var playerHeadTarget
var isPreparingShoot

@onready var warningObject = $warning/Cube
@onready var enemyNavMesh = $"../../../../.." as EnemyNavMesh
# bala means bullet in Spanish lol
var balas : PackedScene = preload("res://Assets/Prefabs/Objects/Bullet_fixed.prefab.tscn")
@onready var shootOrigin = $ShootOrigin
@onready var alert = $"../../../../../Audio/alert"
@onready var shoot = $"../../../../../Audio/shoot"
@onready var debug_label = $"../../../../../DebugLabel"

var coroutineRunning = false
var stopCoroutine = false
@export var reloadTime = 1.5
@export var alertTime = 0.4 # TODO set this back to 0.4

func _ready():
	pass
	
func _on_legs_bot_enable_gun():
	print("turning on gun")
	playerBodyTarget = get_node("/root/player/Body")
	playerHeadTarget = get_node("/root/player/CameraPivot")

func _process(_delta):
	# debug_label.text = "stop coroutines: " + str(stopCoroutine) # TODO remove
	if is_instance_valid(playerBodyTarget):
		# try transform.origin
		look_at(playerBodyTarget.global_position, Vector3.UP, true)
		
	if(!isPreparingShoot && (enemyNavMesh.playerHeadInSight || enemyNavMesh.playerBodyInSight)):
		if !coroutineRunning:
			coroutineRunning = true
			stopCoroutine = false
			await shootingProcedures()
			coroutineRunning = false

	elif(isPreparingShoot && (!enemyNavMesh.playerHeadInSight && !enemyNavMesh.playerBodyInSight) && !warningObject.visible):
		StopBeforeWarning()
		
func StopBeforeWarning():
	stopCoroutine = true
	isPreparingShoot = false
	
func startPreparation():
	isPreparingShoot = true
		
func showWarnings():
	alert.play()
	warningObject.visible = true
		
func shootBullet():
	var bala = balas.instantiate()
	bala.global_position = shootOrigin.global_position
	bala.rotation = shootOrigin.rotation
	
	get_tree().get_root().add_child(bala) # adding bullet to the shootOrigin doesn't work
	
	if enemyNavMesh.playerBodyInSight:
		bala.look_at(playerBodyTarget.global_position, Vector3.UP, true)
	elif enemyNavMesh.playerHeadInSight:
		bala.look_at(playerHeadTarget.global_position, Vector3.UP, true)
	
	bala.add_constant_central_force(global_transform.basis.z * 2700)
	shoot.play()
	isPreparingShoot = false
	warningObject.visible = false
		
func shootingProcedures():
	# it keeps running more instances of this function
	startPreparation()
	# https://gdscript.com/solutions/coroutines-and-yield/
	await get_tree().create_timer(reloadTime).timeout
	if !stopCoroutine:
		showWarnings()
		await get_tree().create_timer(alertTime).timeout
		shootBullet()


