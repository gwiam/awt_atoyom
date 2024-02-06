# Non-Issues:

    - the door prefab is somewhat fine, kinda like legbot
        - model, animations and stuff are there

# Issues:

    - most things are scripts and they all broke
    - even the canvas element broke
    
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


# Personal notes

    - canvas stuff is really confusing all tutorials so far suck
    - effects like chromatic aberration have to be created by hand
