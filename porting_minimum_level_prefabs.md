# Non-Issues:

    - the door prefab is somewhat fine, kinda like legbot
        - model, animations and stuff are there

# Issues:

    - most things are scripts and they all broke
    
# Solutions:

    - fix the door scripts
        - reimplement the spawn script inside the spawn point of the door
            - instantiate player
            - give it the position of the spawn point
            - append to root with "get_node("/root").add_child.call_deferred(playerInstance)"
        - reimplement enemy counter script that opens the door

# Personal notes

    - player is stuck in the ground
    - in unity the instantiation also receives some extra parameters "transform.position" and "Quaternion.LookRotation(-transform.up)"
        - presumably position and rotation