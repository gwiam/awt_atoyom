extends CanvasLayer

@onready var pauseGameManager = $"../PauseGameManager" as PauseGame
@onready var sceneChanger = $"../SceneChanger"


# Continue
func _on_button_pressed():
	pauseGameManager.TogglePause()

# Restart
func _on_button_2_pressed():
	sceneChanger.RestartGame()

# Menu
func _on_button_3_pressed():
	sceneChanger.ChangeScene("Menu")
