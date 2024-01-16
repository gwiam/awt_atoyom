extends CharacterBody3D

@export var rawIncrement : int = 1

@export var movementSpeed = 10

@export var gravityAccel = 9.81

@export var cameraFollowSensitivity = 500

var target_vel = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var movementDir = Vector3.ZERO
	
	movementDir.x = Input.get_axis("rightMove","leftMove")
	movementDir.z = Input.get_axis("backwardMove", "forwardMove")
	if (is_on_floor() && Input.is_action_pressed("jump")):
		# call floaty function
		movementDir.y += 2 * rawIncrement
		
	# normalize vector in case multiple things are pressed
	if movementDir != Vector3.ZERO:
		movementDir = transform.basis * movementDir.normalized()
		#$CameraPivot.look_at(transform.origin + movementDir, Vector3.UP)
		
	target_vel.z = movementDir.z * movementSpeed
	target_vel.x = movementDir.x * movementSpeed
	# handle verticle jumps
	if not is_on_floor():
		target_vel.y = target_vel.y - (gravityAccel * delta)
	else:
		target_vel.y = movementDir.y * movementSpeed

	velocity = target_vel
	move_and_slide()
	
func _input(event):
	if event is InputEventMouseMotion:
		$CameraPivot.rotation.y -= clamp(event.relative.x / cameraFollowSensitivity, deg_to_rad(-45), deg_to_rad(45))
		$CameraPivot.rotation.x += clamp(event.relative.y / cameraFollowSensitivity, deg_to_rad(-45), deg_to_rad(45))
