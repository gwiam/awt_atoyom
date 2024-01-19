# Non-Issues:

    - all models were imported correctly
    - animations imported correctly
    - materials imported correctly
    - the skeleton was translated correctly

# Issues:

    - the gun pivot is controlled by the "EnemyShootBullet" script to always look at the player
    - enemy behavior is completely missing (as expected)
    - audio sources couldn't be imported
    - particles couldn't be imported

# Solutions:

    - rebuild the particle effect
    - rebuild the "Wake up and go" of child and "Set Delay To Wake Up" script of parent node
        - "SetDelayToWakeUp" can also wake up all the enemies after a certain time or using a trigger
        - "SetDelayToWakeUp" is part of LegBot (called AIbody in the level for some reason) 
            - "SetDelayToWakeUp" calls Awake() when LegBot is loaded
            - implement time delays for execution of StartWakeUp and TurnNavMeshAndGunOn
        - more details under "porting_scripts"
    - reimplement navigation
        - adding navigationsagend3d 
        - changing main legbot node to characterbody3d
        - moving collision shape out of the collider, so that it's under characterbody3d
    - use a signal to "enable the navmesh"
    - setting up expression based transitions
        - changing animation expression base node of animation tree to LegBot
        - creating enum to represent expressions (Walking, NotWalking)
            - also changing the expression conditions to be like "state = <state>"

# Personal notes:
    
    - something is super fucked in the animations, there are 140 errors but the animation player still works?
        - just delete all the leftover armature paths
    - how do I call animation nodes like in Unity?
        - (bad idea) by calling the animation player and then play(<animation>) 
            - this causes the animation to loop though, maybe it's better to call the animationtree instead?
                - still loops with animation tree
                - looks like I still need to switch to walk or idle by myself
                - can be stopped by disabling looping in the animation player with the button next to the animation time
                    - make idle loop with this method
            - enabling the animation tree stops the animation player
        - use the animation tree with some string parameter bs like get("parameters/Base Layer/playback") to get the state machine
        - "travel" to the desired node, works even when not connected 
    - there is a "SetWakingUp" method but idk when it's called
        - there seems to be an enemy trigger that the player can walk into
        - that one is activating the scripts in "SetDelayToWakeUp" which activates the enemies
        - "SetDelayToWakeUp" can also wake up all the enemies after a certain time without a trigger
        - "SetDelayToWakeUp" is part of LegBot and AIbody??
            - "SetDelayToWakeUp" calls Awake() when LegBot is loaded?
            - I guess "ready()" does the same thing in Godot
            - so where does it belong to? AIBody or LegBot
                - it seems like the LegBot in the scene has one less layer, as if the outer LegBot was renamed to AIbody
                    - indeed is just seems like it was renamed for no reason
                - adding another legbot breaks the other one, my guess it that it "takes away" the wake up from the existing one
                    - moving the new legbot below (not under) the old one fixes it again
        - how do I get the reference to WakeUpAndGo?
            - like this get_node(nodePath) as WakeUpAndGo
        - commenting out "TurnNavmeshAndGunOn" aparently does nothing?
    - legbot is still clipping into the ground
        - it's the navmesh offset
    - there is a navmesh agent but unidot can't take care of it
    - is the npc class necessary for the navmesh to work?
        - yes... to be exact it needs velocity and move_and_slide
        - but then it needs a shape or else it cannot collide
    - to change animation of animation node choose an animation from the inspector it's not a state machine, the reason you don't have a pen icon!
    - maybe I could change the expressions to nav.target_position = global_position
    - now the damn animation state is stuck of idle....

            
