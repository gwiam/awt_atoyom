extends Node3D

var playerBodyTarget
var playerHeadTarget
var isPreparingShoot

@onready var warningObject = $warning/Cube
@onready var enemyNavMesh = $"../../../../.." as EnemyNavMesh
# WTF does balas even mean? is that "bullets" in another language?
# bala means bullet in Spanish lol
var balas : PackedScene = preload("res://Assets/Prefabs/Objects/Bullet_fixed.prefab.tscn")
@onready var shootOrigin = $ShootOrigin
@onready var alert = $"../../../../../Audio/alert"
@onready var shoot = $"../../../../../Audio/shoot"
@onready var debug_label = $"../../../../../DebugLabel"

var coroutineRunning = false

func _ready():
	pass
	
func _on_legs_bot_enable_gun():
	print("turning on gun")
	playerBodyTarget = get_node("/root/player/Body")
	playerHeadTarget = get_node("/root/player/CameraPivot")

func _process(delta):
	debug_label.text = "isPreparingShoot: " + str(isPreparingShoot) # TODO remove
	if is_instance_valid(playerBodyTarget):
		look_at(playerBodyTarget.global_position, Vector3.UP, true)
		
	if(!isPreparingShoot && (enemyNavMesh.playerHeadInSight || enemyNavMesh.playerBodyInSight)):
		if !coroutineRunning:
			await shootingProcedures()
	elif(isPreparingShoot && (!enemyNavMesh.playerHeadInSight && !enemyNavMesh.playerBodyInSight) && !warningObject.visible):
		StopBeforeWarning()
		
func StopBeforeWarning():
	# TODO stop all coroutines
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
	
	get_node("/root").add_child.call_deferred(bala) # adding bullet to the shootOrigin doesn't work
	
	if enemyNavMesh.playerBodyInSight:
		bala.look_at(playerBodyTarget.global_position)
	elif enemyNavMesh.playerHeadInSight:
		bala.look_at(playerHeadTarget.global_position)
	
	bala.apply_central_force(global_transform.basis.z * 2700)
	shoot.play()
	isPreparingShoot = false
	warningObject.visible = false
		
func shootingProcedures():
	# it keeps running more instances of this function
	coroutineRunning = true
	startPreparation()
	# https://gdscript.com/solutions/coroutines-and-yield/
	await get_tree().create_timer(1.0).timeout
	showWarnings()
	await get_tree().create_timer(1.0).timeout
	shootBullet()
	coroutineRunning = false
	
	
	
	


