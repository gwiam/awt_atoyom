extends CharacterBody3D

# values taken from Unity navmesh agent
var speed = 5
var accel = 40
@onready var nav:NavigationAgent3D = $NavigationAgent3D
@onready var animationTree = $LegsBot/AnimationTree

func _ready():
	StopNavigationAgent()

func _on_legs_bot_enable_navmesh():
	print("turned on navmesh")
	if is_instance_valid(nav):
		animationTree.changeStateWalking()
		nav.target_position = Vector3(0,0,16)

func _physics_process(_delta):
	var next = nav.get_next_path_position()
	var current = global_position
	var new_velocity = current.direction_to(next)
	# in Godot you need to implement your own movement
	# some stuff from a youtube video, I might need to change it
	velocity = velocity.move_toward(new_velocity,.25)
	
	move_and_slide()
	
func StopNavigationAgent():
	animationTree.changeStateWalking() # TODO undo to now walking
	nav.target_position = global_position

