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
        - "SetDelayToWakeUp" is part of LegBot and AIbody
            - "SetDelayToWakeUp" calls Awake() when LegBot is loaded
        - more details under "porting_scripts"
        

# Personal notes:
    
    - something is super fucked in the animations, there are 140 errors but the animation player still works?
    - how do I call animation nodes like in Unity?
        - by calling the animationplayer and then play(<animation>) 
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
    - legbot is still clipping into the ground
        - maybe moving the colider in Unity moves the whole legbot?

            
