extends Node3D

class_name CameraMovement

var sensivity
var isPaused = false
@onready var player = $".."

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	# setting cursor.visible to false is not necessary
	sensivity = 0.2 # TODO get this from the settings


func _input(event):
	if event is InputEventMouseMotion && !isPaused:
		player.rotate_y(deg_to_rad(-event.relative.x * sensivity))
		rotate_x(deg_to_rad(event.relative.y * sensivity))
		rotation.x = clamp(rotation.x,deg_to_rad(-90),deg_to_rad(90))
