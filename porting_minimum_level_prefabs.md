# Non-Issues:

    - the door prefab is somewhat fine, kinda like legbot
        - model, animations and stuff are there

# Issues:

    - most things are scripts and they all broke
    - even the canvas element broke, though godot has a similar canvas system
    
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
    - recreate the canvas
        - again, no need for textmesh pro, label2D does the job
        - alignment is all handled similarly to Unity
            - though texture placement is controlled by "strech_mode" and "expand_mode"
                - inconsistent, you may need to reposition the anchor or the entire element for it to take effect 
                - size cannot be adjusted unless strech_mode is set to "ignore size" (maybe move this section to porting_UI or something)
                - keep size and set strech mode to keep centered
                - manually calculate scale by <unity size>/<texture size>*<unity scale>


# Personal notes

    - canvas seems to have no "canvas render" equivalent, don't think it's needed
    - effects like chromatic aberration have to be created by hand
    - slow motion causes the bullet force to be weaker
        - maybe set velocity instead?
            - somehow doesn't work
        - force functions naming is inconsistant
            - why is it add_constant_central_force for ridigbody3D!?
