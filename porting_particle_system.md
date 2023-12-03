# Non-Issues:

    - nothing, everything was fucked

# Issues:

    - imported particle node seems completely broken
    - there are pro builder scripts in the Unity version that reshape the window from a cube into a plane, this is probably done to dynamically scale the windows size together with the particle emitter
    - seems like Godot has no particle shaders at all

# Solutions:

    - not gonna sugarcoat it: I gotta rebuild the whole effect
    - instead of porting the particle shader I'll just use a png

# Personal notes:

    - seems like the Unity setting only survived as a "dictionary" and are basically useless
    - how do I make the plane two faced?
        disable culling on material
    - rotating particles is extremely unintuitive, seems to be only possible around Y but for some reason this is not correct, even thought the Unity version also rotated around y
        there was a toggle for local coordinates in drawing...
    - I'll have to recreate the script...