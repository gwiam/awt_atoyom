# Non-Issue:

    - level geometry was translated correctly
    - the door was translated correctly
    - enemies are present

# Issue:

    - window prefab completely broken
    - lighting completely broken
    - of cause all the game logic is missing
        specifically the sky material was not translated at all

# Solution:

    - rebuild window prefab, along with the [particle system](porting_particle_system.md) idk why this link does not working a list
    - adding a "ProceduralSkyMaterial" to Environment
    - enabling SDFGI and SSAO
    - enabling glow
    - this needs further tweaking but it's ok for now

# Personal notes

    - global lighting in Unity is handled in the lighting window (has to be manually opened)
    - both engines use a sort of sky material
    - 1-1 translation of the lighting is obviously not possible
    - looks like the navmesh made it over
    - baking lighting in unity looks a bit different than the current lighting
    - the window "lights" look awful, idk why they look so different from the preview
