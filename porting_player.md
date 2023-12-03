# Issues:
    
    - all the controls are not working
    - the capsule colider is wrong, making you clip into the ground
    - animations have a similar issue as legbot's


# Solutions:

    - for capsule colider: adjust height to the values in unity
    - delete "Camera/HUDcamera/hand/" from the path to fix animations

# Personal notes:

    - seems like the radius of the colider was imported correctly but not the height?
    - the material looks better than on the legbot, turns out they're both supposed to use the "shiny white" material