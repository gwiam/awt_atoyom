# Non-issues:

- models are ported correctly
- animations ported correctly
- animation controller basically intact
- prefab actually survived

# Issues:
    
- all the controls are not working
- the capsule colider is wrong, making you clip into the ground
- all the skripts are of cause not there
- audio sources couldn't be imported
- animation crossfades aren't imported
- characterbody3d doesn't have a "body_entered" signal but rigidbody3d has no "is_on_floor()"

# Solutions:

- for capsule colider: adjust height to the values in unity
- delete "Camera/HUDcamera/hand/" from the path to fix animations
- Godot has special CharacterBody3D type that makes player physics easier
- reimplement "GotHit"
    - add an Area3D and use it's body_entered
    - set collision mask to include bullet
    - both area and characterbody need a collision shape, so copy capsule collider
        
# Personal notes:

- seems like the radius of the colider was imported correctly but not the height?
- it ported in 2 animation players, idk why...
- maybe removing all the stuff that wont work anways improves the import quality?
- bullet sometimes despawns on Character3D collider before hitting Area3D, causing shotty hit detection
    - either play around with layers to prevent bullet from colliding with the characterbody
    - make Area3D a little bigger than the CharacterBody