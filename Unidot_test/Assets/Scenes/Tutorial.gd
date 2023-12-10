extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	# instantiate player
	pass
	# reset camera
	# load textmesh


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	pass


func _on_box_collider_body_entered(body):
	#wake up legbot enemy
	$AIbody/LegBot/LegsBot/AnimationPlayer2.play("wakeUp")
	
