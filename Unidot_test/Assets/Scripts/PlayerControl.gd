extends CharacterBody3D

@export var rawIncrement : int = 1

@export var movementSpeed = 10

@export var gravityAccel = 9.81

@export var mouseSens = 0.2

var target_vel = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var movementDir = Vector3.ZERO
	
	var inputDir = Input.get_vector("rightMove", "leftMove","backwardMove","forwardMove")
	movementDir = (transform.basis * Vector3(inputDir.x,0,inputDir.y)).normalized()
	if (is_on_floor() && Input.is_action_pressed("jump")):
		# call floaty function
		movementDir.y += 2 * rawIncrement
		
	
		
	target_vel.z = (movementDir.z) * movementSpeed
	target_vel.x = (movementDir.x) * movementSpeed
	# handle verticle jumps
	if not is_on_floor():
		target_vel.y = target_vel.y - (gravityAccel * delta)
	else:
		target_vel.y = movementDir.y * movementSpeed

	velocity = target_vel
	move_and_slide()
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouseSens))
		$CameraPivot.rotate_x(deg_to_rad(event.relative.y * mouseSens))
