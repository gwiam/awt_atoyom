# Non-issues:

    - models are ported correctly

# Issues:
    
- missing it's monobehavior
- collider doesn't report any collisions by default
- bullet trail not imported
- particle effects not ported
- trail effect not ported, not in base godot

# Solutions:

- recreate DestroyOnImpact
- enable contact monitor either in code (see porting_scripts) or by setting Contact Monitor and Max Contacts Reported in the inspector
    - _on_body_entered destroy the bullet by calling "queue_free()"

# Personal notes:

- balas means bullets in spanish
- maybe trails could be done with particlesystem?