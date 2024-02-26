# Non-Issues:

    - the door prefab is somewhat fine, kinda like legbot
        - model, animations and stuff are there
        - images for UI elements like the crosshair were also imported

# Issues:

- most things are scripts and they all broke
- even the canvas element broke, though godot has a similar canvas system
- Godot doesn't have built in effects like chromatic abberation
- StaticBody3D doesn't have a signal for collision either...
    
# Solutions:

- fix the door scripts
    - reimplement the spawn script inside the spawn point of the door
        - instantiate player
        - give it the position of the spawn point
        - append to root with "get_node("/root").add_child.call_deferred(playerInstance)"
    - reimplement enemy counter script that opens the door
    - reimplement pause menu
    - reimplement EnemyTracker
        - reimplement animation state like in LegBot
            - create a dedicated animation state script
            - correct expression for transition
    - reimplement WinGameCollider
        - change BoxCollider node type from StaticBody3D to Area3D
- reimplement "TimeManager"
    - this has the slowmo functionality (not part of player prefab)
    - more info in porting_scripts
- reimplement "HealthManager"
    - instead of setting time_scale to 0, pause the game (see porting scripts)
    - game needs to be unpaused before reload
    - set time_scale to 1 just in case
    - player need to be freed, otherwise it would spawn a second player which causes issues
    - bullet that killed player persists and needs to be removed too
        - use get_children() on root and free them, EXCEPT FOR ROOTNODE3D or else the game crashes
- no real need to change Manager prefabs since the only relevant thing is the script
- recreate the canvas (see porting canvas)
- recreate the GameOverCanvas
- recreate the PauseGameCanvas and PauseGameManager


# Personal notes

- effects like chromatic aberration have to be created by hand
    - maybe try this https://godotshaders.com/shader/chromatic-abberation/
- slow motion causes the bullet force to be weaker
    - maybe set velocity instead?
        - somehow doesn't work
    - force functions naming is inconsistant
        - why is it add_constant_central_force for ridigbody3D but apply_constant_central_force for rigidbody2D!?
- how do I carry exported variables to a higher level scene?
- pausing in Unity sets a bunch of scripts to be paused
    - just set the process mode
- pausing doesn't pause the coroutine and the bot shoots immediately
- get freeing all the child nodes causes the game to crash
