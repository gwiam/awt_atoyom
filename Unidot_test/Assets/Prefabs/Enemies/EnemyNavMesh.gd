extends CharacterBody3D

# values taken from Unity navmesh agent
@export var speed = 5
@export var accel = 40
@export var angular_speed = 900
@export var DistanceFromTargetToStop = 1 # may need adjustment from the unity value
@onready var nav:NavigationAgent3D = $NavigationAgent3D
@onready var animationTree = $LegsBot/AnimationTree


func _ready():
	StopNavigationAgent()

func _on_legs_bot_enable_navmesh():
	print("turned on navmesh")
	if is_instance_valid(nav):
		animationTree.changeStateWalking()
		nav.target_position = Vector3(0,0,16)


func _physics_process(delta):
	var next = nav.get_next_path_position()
	var current = global_position
	var new_velocity = current.direction_to(next)*speed
	# in Godot you need to implement your own movement
	# some stuff from a youtube video, I might need to change it
	velocity = velocity.move_toward(new_velocity,accel) 
	look_at(next,Vector3.UP, true) # TODO smooth turning
	#rotation.y = lerp_angle(atan2(next.x,next.z),atan2(new_velocity.x,new_velocity.z), delta * 1)
	
	move_and_slide()
	if(nav.distance_to_target() < DistanceFromTargetToStop):
		StopNavigationAgent()
	
func StopNavigationAgent():
	animationTree.changeStateNotWalking()
	nav.target_position = global_position

