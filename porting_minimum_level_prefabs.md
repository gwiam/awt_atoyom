# Non-Issues:

    - the door prefab is somewhat fine, kinda like legbot
        - model, animations and stuff are there
        - images for UI elements like the crosshair were also imported

# Issues:

    - most things are scripts and they all broke
    - even the canvas element broke, though godot has a similar canvas system
    - Godot doesn't have built in effects like chromatic abberation
    
# Solutions:

    - fix the door scripts
        - reimplement the spawn script inside the spawn point of the door
            - instantiate player
            - give it the position of the spawn point
            - append to root with "get_node("/root").add_child.call_deferred(playerInstance)"
        - reimplement enemy counter script that opens the door
        - reimplement pause menu
    - reimplement "TimeManager"
        - this has the slowmo functionality (not part of player prefab)
        - more info in porting_scripts
    - reimplement "HealthManager"
    - no real need to change Manager prefabs since the only relevant thing is the script
    - recreate the canvas
    - recreate the GameOverCanvas


# Personal notes

    - effects like chromatic aberration have to be created by hand
    - slow motion causes the bullet force to be weaker
        - maybe set velocity instead?
            - somehow doesn't work
        - force functions naming is inconsistant
            - why is it add_constant_central_force for ridigbody3D but apply_constant_central_force for rigidbody2D!?
