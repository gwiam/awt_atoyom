extends Node3D

class_name SceneChanger

const scenesPath = "res://Assets/Scenes/"

const sceneSuffix = "_fixed.tscn"

func RestartGame():
	print("restarting")
	Engine.time_scale = 1
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func ChangeScene(sceneName):
	get_tree().paused = false
	get_tree().change_scene_to_file(scenesPath+sceneName+sceneSuffix)
	if sceneName == "Menu":
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	
func StartSceneFromMenu():
	# TODO hardcoded for now
	get_tree().paused = false
	get_tree().change_scene_to_file(scenesPath+"FirstSteps"+sceneSuffix)
	
func ExitGame():
	get_tree().quit()
