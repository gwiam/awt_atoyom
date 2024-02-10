# Non-Issues:

    - nothing, everything was fucked

# Issues:

    - imported particle node seems completely broken
    - there are pro builder scripts in the Unity version that reshape the window from a cube into a plane, this is probably done to dynamically scale the windows size together with the particle emitter
    - particle systems are very different, direct translation very difficult
    - seems like Godot has no particle shader materials at all
    - Godot lacks a bunch of emitter shapes, like cone
    - Godot's particle system only allows for rotation around Y

# Solutions:

    - not gonna sugarcoat it: I gotta rebuild the whole effect
    - instead of porting the particle shader I'll just use a png
    - under Process Material create new ParticleProcessMaterial
    - under Draw Passes, under Pass 1 create new particle shape
    - most things need to be eyeballed

# Personal notes:

    - seems like the Unity setting only survived as a "dictionary" and are basically useless
    - how do I make the plane two faced?
        disable culling on material
    - rotating particles is extremely unintuitive, seems to be only possible around Y but for some reason this is not correct, even thought the Unity version also rotated around y
        there was a toggle for local coordinates in drawing...
    - the dimesions just won't add up, I'm just eyeballing at this point