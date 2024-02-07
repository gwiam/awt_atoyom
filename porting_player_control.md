# Issues

- Since mechanics of GDScript and Godot engine very different, nothing can be auto-imported and most things have to be done from scratch

# Outstanding problems

- Relative movement is broken [not sure why]
    - that's because you forgot to multiply with the transform basis...
- floating mechanics during slowmotion still outstanding issue
- capture and shoot mechanics not implemented

# Solutions

- use the built in player physics provided by godot as much as possible
- recreate CameraMovement
    - clamp x axis to -90 to 90 degrees or else the x rotation can loop
    - rotate y of "player" instead of "orientation"
        - original implementation confusing
        - saves time on implementing scripts like "CameraFollow"
- recreate HoldAndShoot
    - setting NoCollision, Shot and Grad layers to unused layers for now
    - instead of implementing it like the original, casting a ray each update
        - add a raycaster object to camera instead
        - makes more sense that in "isPlayerInSight" since Ray is always facing forwards
        - should save quite a bit of code
        - makes second raycast superfluous
        - the shoot raycast is also not necessary
            - cast infinite ray forwards
            - if it doesn't collide with anything the bala gets rotated forwards anyways
        - to check for collision simply do is_colliding
        - to get the collider do get_collider
    - set bullet freeze behavior to static to prevent collision with the player

# Notes

- GDScript very straight forward, similar to Python
- player movement and input capture is much more intuitive to implement in Godot than in Unity
- how to stop the mouse from existing the screen?
    - with "Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)"
- movement needs to be smoothed out, could do this with lerp but this is probably unfaithful to the orginal
- jumping feels too floaty, I could turn up the gravity but this feels wrong
- camera movement was implemented in a different file
    - original implementation seems nonsensicle
- since physics interpolation doesn't exist in Godot 4 maybe I don't need to worry about it