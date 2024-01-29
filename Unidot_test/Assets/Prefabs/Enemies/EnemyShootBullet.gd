extends Node3D

var playerBodyTarget
var playerHeadTarget
var isPreparingShoot

@onready var warningObject = $warning/Cube
@onready var enemyNavMesh = $"../../../../.." as EnemyNavMesh
# WTF does balas even mean? is that "bullets" in another language?
var balas : PackedScene = preload("res://Assets/Prefabs/Objects/Bullet_fixed.prefab.tscn")
@onready var shootOrigin = $ShootOrigin

func _ready():
	pass
	
func _on_legs_bot_enable_gun():
	print("turning on gun")
	playerBodyTarget = get_node("/root/player/Body")
	playerHeadTarget = get_node("/root/player/CameraPivot")

func _process(delta):
	if is_instance_valid(playerBodyTarget):
		look_at(playerBodyTarget.global_position, Vector3.UP, true)
		
	if(!isPreparingShoot && (enemyNavMesh.playerHeadInSight || enemyNavMesh.playerBodyInSight)):
		await shootingProcedures()
	elif(isPreparingShoot && (!enemyNavMesh.playerHeadInSight && !enemyNavMesh.playerBodyInSight) && !warningObject.visible):
		StopBeforeWarning()
		
func StopBeforeWarning():
	# TODO stop all coroutines
	# I bet this is how I keep it from firing more and more bullets
	isPreparingShoot = false
	
func startPreparation():
	isPreparingShoot = true
		
func showWarnings():
	# TODO play sound
	warningObject.visible = true
		
func shootBullet():
	# it keeps spawning more and more bullets
	var bala = balas.instantiate()
	bala.global_position = shootOrigin.global_position
	bala.rotation = shootOrigin.rotation
	
	get_node("/root").add_child.call_deferred(bala) # adding bullet to the shootOrigin doesn't work
	
	if enemyNavMesh.playerBodyInSight:
		bala.look_at(playerBodyTarget.global_position)
	elif enemyNavMesh.playerHeadInSight:
		bala.look_at(playerHeadTarget.global_position)
	
	bala.apply_central_force(global_transform.basis.z * 2700)
	# TODO play sound
	isPreparingShoot = false
	warningObject.visible = false
		
func shootingProcedures():
	startPreparation()
	# https://gdscript.com/solutions/coroutines-and-yield/
	await get_tree().create_timer(1.0).timeout
	showWarnings()
	await get_tree().create_timer(1.0).timeout
	shootBullet()
	
	
	
	


