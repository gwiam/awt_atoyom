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

# Solutions:

    - for capsule colider: adjust height to the values in unity
    - delete "Camera/HUDcamera/hand/" from the path to fix animations

# Personal notes:

    - seems like the radius of the colider was imported correctly but not the height?
    - it ported in 2 animation players, idk why...
    - lol the animations got imported correctly now
    - maybe removing all the stuff that wont work anways improves the import quality?