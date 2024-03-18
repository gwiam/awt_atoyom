extends Node3D

class_name SceneChanger

const scenesPath = "res://Assets/Scenes/"

const sceneSuffix = "_fixed.tscn"

func RestartGame():
	print("restarting")
	# reloading current scene does not remove any newly spawned nodes
	# so you need to remove them manually
	#var children = get_node("/root").get_children()
	#for child in children:
		#if child.name != "RootNode3D":
			#child.queue_free()
	Engine.time_scale = 1
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func ChangeScene(sceneName):
	get_tree().paused = false
	get_tree().change_scene_to_file(scenesPath+sceneName+sceneSuffix)
	
func StartSceneFromMenu():
	# TODO hardcoded for now
	get_tree().paused = false
	get_tree().change_scene_to_file(scenesPath+"FirstSteps"+sceneSuffix)
	
func ExitGame():
	get_tree().quit()
