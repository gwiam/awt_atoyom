Issue:

    - Armature node paths of the animations aren't translated correctly
    - gun pivot point only exists on the legbot prefab, not on the model and was not imported
    - the gun pivot is controlled by the "EnemyShootBullet" script to always look at the player

Solution to animation node paths:

    - thankfully one animation with correct paths has survived the import
    - rewrite node paths to look like the ones from the intact animation
    - usually means replacing "/Body/" with "/Skeleton3D:"
    - sometimes paths would also have something like "/leg1_L/" in it, which had to be deleted
    - sometimes paths were too short, in which case "/Skeleton3D:" had to be added
    - readd the pivot point as "BoneAttachment3D" and copy the gun to that point

Personal notes:
    
    - now I have to find out how to put the gun on a pivot point
    - how do I add a bone to the Skeleton3D? It seems impossible
    - looks like I didn't need to do that