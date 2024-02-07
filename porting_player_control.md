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
        

# Notes

- GDScript very straight forward, similar to Python
- player movement and input capture is much more intuitive to implement in Godot than in Unity
- how to stop the mouse from existing the screen?
    - with "Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)"
- movement needs to be smoothed out, could do this with lerp but this is probably unfaithful to the orginal
- jumping feels too floaty, I could turn up the gravity but this feels wrong
- camera movement was implemented in a different file
    - original implementation seems nonsensicle
    - 