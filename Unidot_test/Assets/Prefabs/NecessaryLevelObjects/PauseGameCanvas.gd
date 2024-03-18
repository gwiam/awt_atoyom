extends CanvasLayer

@onready var pauseGameManager = $"../PauseGameManager" as PauseGame
@onready var sceneChanger = $"../SceneChanger"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Continue
func _on_button_pressed():
	pauseGameManager.TogglePause()

# Restart
func _on_button_2_pressed():
	sceneChanger.RestartGame()

# Menu
func _on_button_3_pressed():
	sceneChanger.ChangeScene("Menu")
