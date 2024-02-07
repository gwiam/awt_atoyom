# Non-Issues:

    - Godot at least has a navgiation agent
    - Navmesh is translated when importing but needs to be rebaked

# Issues:

    - navigation is way more annoying under Godot because the movement code needs to be written by yourself
    - there is no simple way to stop the navagent
    - movement needs to implemented yourself

# Solutions:

    - setting target_position to global position stops the nav agent but the target is lost
    - write your own movement function for agent
    - entity need to be ridigbody3D or characterbody3D
    - TODO add more info from the Godot doku