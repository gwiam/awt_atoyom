extends BoxContainer

@onready var sceneManager = $"../../SceneManager"

# Play
func _on_button_pressed():
	sceneManager.StartSceneFromMenu()

# Settings
func _on_button_1_pressed():
	pass # TODO

# Exit
func _on_button_2_pressed():
	sceneManager.ExitGame()
