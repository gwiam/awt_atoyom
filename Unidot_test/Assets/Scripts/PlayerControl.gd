extends CharacterBody3D

@export var movementSpeed = 10
@export var gravityAccel = 9.81
@export var mouseSens = 0.2
@export var jumpVelocity = 1
@export var lerpSpeed = 20

var target_vel = Vector3.ZERO

func _ready():
	pass

func _physics_process(delta):
	
	var movementDir = Vector3.ZERO
	
	var inputDir = Input.get_vector("rightMove", "leftMove","backwardMove","forwardMove")
	movementDir = (transform.basis * Vector3(inputDir.x,0,inputDir.y)).normalized()
	if (is_on_floor() && Input.is_action_pressed("jump")):
		# this or gravity needs to be adjusted because it is too floaty by default
		movementDir.y += jumpVelocity
		
	target_vel.z = lerp(target_vel.z,(movementDir.z) * movementSpeed,delta*lerpSpeed)
	target_vel.x = lerp(target_vel.x,(movementDir.x) * movementSpeed,delta*lerpSpeed)
	# handle verticle jumps
	if not is_on_floor():
		target_vel.y -= gravityAccel * delta
	else:
		target_vel.y = movementDir.y * movementSpeed

	velocity = target_vel
	move_and_slide()
