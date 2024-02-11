extends CharacterBody3D

class_name EnemyNavMesh

@onready var nav:NavigationAgent3D = $NavigationAgent3D
@onready var animationTree = $LegsBot/AnimationTree
@onready var BulletSpawnLocation = $LegsBot/Armature/Skeleton3D/Body/GunPivot/ShootOrigin
@onready var debugLabel = $DebugLabel # TODO remove
@export var speed = 5
var currentSpeed = 0
@export var accel = 40
@export var angularSpeed = 10
@export var DistanceFromTargetToStop = 6 # may need adjustment from the unity value
var positionToGo
var cam
var playerHeadInSight
var playerBodyInSight

func _ready():
	StopNavigationAgent()

func _on_legs_bot_enable_navmesh():
	print("turned on navmesh")
	if is_instance_valid(nav):
		animationTree.changeStateWalking()
		positionToGo = get_node("/root/player")
		cam = get_node("/root/player/CameraPivot")

func _physics_process(delta):
	# debugLabel.text = "currentSpeed " + str(currentSpeed)
	if is_instance_valid(positionToGo) && is_instance_valid(cam):
		isPlayerInSight()
		nav.target_position = positionToGo.global_position
		var isPlayerCloseEnough = nav.distance_to_target() < DistanceFromTargetToStop
		if((playerHeadInSight || playerBodyInSight) && isPlayerCloseEnough):
			StopWithDelay()
		elif(!nav.is_target_reachable() && nav.distance_to_target() < 1):
			StopNavigationAgent()
		else:
			ContinueNavigationAgent()
	else:
		ContinueNavigationAgent()
		
	if currentSpeed != 0:
		var next = nav.get_next_path_position()
		var current = global_position
		var new_velocity = current.direction_to(next)*currentSpeed
		
		velocity = velocity.move_toward(new_velocity,accel) 
		if velocity != Vector3.ZERO:
			var velocity_angle = atan2(new_velocity.x,new_velocity.z)
			rotation.y = lerp_angle(rotation.y,velocity_angle, delta * angularSpeed)
		
		move_and_slide()
	
func StopWithDelay():
	await get_tree().create_timer(0.2).timeout
	StopNavigationAgent()
	
func StopNavigationAgent():
	animationTree.changeStateNotWalking()
	currentSpeed = 0
	
func ContinueNavigationAgent():
	animationTree.changeStateWalking()
	currentSpeed = speed

func isPlayerInSight(): 
	var space_state = get_world_3d().direct_space_state
	var bodyQuery = PhysicsRayQueryParameters3D.create(BulletSpawnLocation.global_position, positionToGo.global_position, collision_mask,[self])
	var headQuery = PhysicsRayQueryParameters3D.create(BulletSpawnLocation.global_position, cam.global_position, collision_mask,[self])

	var resultBody = space_state.intersect_ray(bodyQuery) 
	var resultHead = space_state.intersect_ray(headQuery)
	if resultBody && resultBody.collider == positionToGo:
		playerBodyInSight = true
	else:
		playerBodyInSight = false
	if resultHead && resultHead.collider == cam:
		playerHeadInSight = true
	else:
		playerHeadInSight = false
	#if resultBody && resultHead:
	#	debugLabel.text = "head: " + str(resultHead.collider) + "; body: " + str(resultHead.collider)

