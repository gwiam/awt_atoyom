extends AnimationTree

enum {
	Walking,
	NotWalking
}

var state = Walking

# Called when the node enters the scene tree for the first time.
func _ready():
	state = Walking # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func changeStateWalking():
	state = Walking
	
func changeStateNotWalking():
	state = NotWalking
