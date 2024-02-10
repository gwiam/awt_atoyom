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
- physics are very different with different time scales
    - causes the bullet to just drop on the floor
- animation crossfades aren't imported
- same problem with characterbody3d as with player

# Solutions:

- rebuild the particle effect
- rebuild the "Wake up and go" of child and "Set Delay To Wake Up" script of parent node
    - "SetDelayToWakeUp" can also wake up all the enemies after a certain time or using a trigger
    - "SetDelayToWakeUp" is part of LegBot (called AIbody in the level for some reason) 
        - implement time delays for execution of StartWakeUp and TurnNavMeshAndGunOn
        - although _enter_tree is the true equivalent of Awake, _ready works better
    - more details under "porting_scripts"
- use a signal to enable the navigation and the gun
- reimplement navigation
    - adding navigationsagend3d 
    - changing main legbot node to characterbody3d
    - moving collision shape out of the collider, so that it's under characterbody3d
    - writing a whole script for movement inside _physics_process
        - getting next and current position
        - calculating and setting velocity (built into CharacterBody3D)
        - implemting smooth turning with lerp_angle
            - angular speed had to be changed
            - turning is stopped if velocity is 0 to prevent weird turning behavior
    - implementing the isPlayerInSight function with raycasting (see porting_scripts)
        - important for "EnemyShootBullet"
        - imortant that the sight check works regardless of bullets or effects blocking the sight
    - to stop navigation created a global var "currentSpeed" and set that to 0 to stop and to const "speed" to the orginial speed
- setting up expression based transitions
    - changing animation expression base node of animation tree to LegBot
    - creating enum to represent expressions (Walking, NotWalking)
    - also changing the expression conditions to be like "state = <state>"
- also make animation transition smoothly by setting a crossfade
    - transition times are taken from the original but there seems to be no way of saying when the fade should start
- reimplement gun
    - recreate "EnemyShootBullet" of GunPivot
        - coroutines cannot be done like in Unity because they cannot be interrupted
        - instead done with a simple bool and if statement to abort coroutine indirectly
        - use add_constant_central_force instead of apply_central_force to prevent the bullet from dropping on the floor during slowmo
        - force then needs to be manually removed
    - put Legbot on another layer to prevent it from colliding with the bullet
        - also make sure legbot and bullet are not on the same layer
    - fix the bullet prefab (more in porting bullet)
- recreate audio source by adding AutoStreamPlayer3D, thankfully the sounds themselves have been imported
    - most audio can just be played through a script
    - step sounds are played by the legbotWalk2 animation
        - just like in Unity add a new track
        - add keyframes for each step
        - add step sound to each keyframe
- add an area3d for collision detection


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
    - it's the navmesh offset in unity
    - doesn't work in Godot though, at least not imediately
- there is a navmesh agent but unidot can't take care of it
- is the npc class necessary for the navmesh to work?
    - yes and no... to be exact it needs velocity and move_and_slide
    - but then it needs a shape or else it cannot collide
- to change animation of animation node choose an animation from the inspector it's not a state machine, the reason you don't have a pen icon!
- animations aren't blending smoothly
    - I can add a crossfade time
- maybe I could change the expressions to nav.target_position = global_position
- now the damn animation state is stuck of idle....
    - nvm Godot is actually retarded and didn't "save" the expressions
- calculating velocity is a little strange
    - right now I am doing velocity.move_toward(new_velocity*speed,accel)
    - but if the syntax of move_toward is <direction> and <amount> then this is bullshit
- onto coroutines...
    - in EnemyShootBullet a coroutine is started to do the firing routine
    - StopBeforeWarning interrupts coroutine between preparing to shoot and flashing the warning
        - if you keep breaking line of sight the bot will just follow you around without warning or shooting
        - alternatively I could check if player is still in line of sight after the preparation timer runs out
    - maybe Await is a fitting equivalent? yield for sure isn't
        - a tutorial shows a timeout which is perfect for what I need
        - it keeps piling on so I am not using it correctly
        - seems like yield isn't used in Godot 4 anymore
    - there is no "StopAllCoroutines", how do I stop the bot from shooting wildly?
        - await waits for a signal, maybe that's why it keeps piling on?
            - try and not await for shootingProcedures
                - that didn't seem to change anything
        - original code has StartCoroutine in the update function
            - but if that is the problem why doesn't unity pile on coroutines?
        - changing process to physics_process doesn't help either
        - maybe it's because of the two await statements and the timers "confusing" the awaits
            - nope
        - for now I am preventing await from being called multiple times by setting a condition
        - to imitate the "StopCoroutine" thing I could maybe make a signal that is either emitted by the end of the coroutine or the "StopBeforeWarning" function
            - I have a feeling that this won't cancel the function
            - just use a bool instead, this will actually cancel the coroutine
- I don't know where the walk sound effect is played in the original version
    - apparently it's played by the "PlaySomeAudio" script but the only function inside of it "PlayAudio" is not referenced anywhere?!
    - found it: it's those little tampon marker thingies at the top of the animation timeline
    - million dollar question: can godot do something similar?
        - yes and it works!
- smooth turning works but the bot spawns facing the wrong direction
- bullet is always facing towards Z
    - set use_model_front to true
- bullet disappears after shot
    - probably because it is colliding with the bot itself
- audio stops playing as soon as the object is freed
    - probably have to make the legbot invisible or else it's gonna stand there unit the audio finishes playing
- porting the dies particles but not accurately
        
    

            
