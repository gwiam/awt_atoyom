extends AnimationTree

enum {
	Open,
	Closed
}
var state = Closed

func changeStateOpen():
	state = Open
