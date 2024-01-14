extends CharacterBody3D

# values taken from Unity navmesh agent
var speed = 5
var accel = 40
@onready var nav:NavigationAgent3D = $NavigationAgent3D


func _ready():
	print("navigation ready")
	nav.target_position = global_position

func _on_legs_bot_enable_navmesh():
	print("turned on navmesh")
	if is_instance_valid(nav):
		nav.target_position = Vector3(0,0,16)

func _physics_process(_delta):
	
	var next = nav.get_next_path_position()
	var current = global_position
	var new_velocity = current.direction_to(next)
	# some stuff from a youtube video, I might need to change it
	velocity = velocity.move_toward(new_velocity,.25)
	
	move_and_slide()
	

