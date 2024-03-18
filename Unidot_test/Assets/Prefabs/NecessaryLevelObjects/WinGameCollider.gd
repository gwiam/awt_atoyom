extends Area3D

@onready var sceneChanger = $"../../../SceneChanger" as SceneChanger

func _on_body_entered(body):
	# TODO hardcoded to menu
	if body.name == "player":
		sceneChanger.ChangeScene("Menu")
		
