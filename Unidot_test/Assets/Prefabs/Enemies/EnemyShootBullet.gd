extends Node3D

var playerBodyTarget
var playerHeadTarget
var isPreparingShoot

@onready var warningObject = $warning/Cube
@onready var enemyNavMesh = $"../../../../.." as EnemyNavMesh
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _on_legs_bot_enable_gun():
	# TODO playerHeadTarget
	print("turning on gun")
	playerBodyTarget = get_node("/root/player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_instance_valid(playerBodyTarget):
		look_at(playerBodyTarget.position, Vector3.UP, true)
		
	if(!isPreparingShoot && (enemyNavMesh.playerHeadInSight || enemyNavMesh.playerBodyInSight)):
		await shootingProcedures()
	elif(isPreparingShoot && (!enemyNavMesh.playerHeadInSight && !enemyNavMesh.playerBodyInSight) && !warningObject.visible):
		StopBeforeWarning()
		
func StopBeforeWarning():
	# TODO stop all coroutines
	isPreparingShoot = false
	
func startPreparation():
	isPreparingShoot = true
		
func showWarnings():
	# TODO play sound
	warningObject.visible = true
		
func shootBullet():
	# TODO acutally shoot bullet
	# TODO link up with EnemyNavMesh to aim bullet at player
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
	
	
	
	


