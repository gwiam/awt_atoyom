# Non-Issue:

    - level geometry was translated correctly
    - all of the point lights for the windows
    - the door was translated correctly
    - enemies are present
    - reflection probe was translated correctly

# Issue:

    - window prefab completely broken
    - lighting broken, specifically the sky material was not translated at all
    - of cause all the game logic is missing

# Solution:

    - rebuild window prefab, along with the [particle system](porting_particle_system.md) idk why this link does not working a list
    - adding a "ProceduralSkyMaterial" to Environment
    
    - this needs further tweaking but it's ok for now
    - for navigation to work the entire "map" needs to be a child of navigation region

# Personal notes

    - global lighting in Unity is handled in the lighting window (has to be manually opened)
    - both engines use a sort of sky material
    - 1-1 translation of the lighting is obviously not possible
    - baking lighting in unity looks a bit different than the current lighting (in unity)
    - aparently the lighting was fine when translating the tutorial, maybe the player camera does something diffent?
    - Godot baked a navmesh on top of the level...
    - enabling SDFGI and SSAO and enabling glow is not possible in compatibility mode
