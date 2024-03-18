- https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_web.html contains tips on how to host game instance
- inkl premade script
- functional
- lighting is absolute dogwater
- particle effects cause lag

- setting render from Forward+ to Compatibility didn't fix the web export but it made the regular export look just as bad
    - it always uses Compatibility mode when exporting to web
    - Compatibility is missing support for a lot of features
        - no glow
        - no SSAO
        - no LightmapGI (they say it will be implemented later)
        - no SDFGI
        - no VoxelGI (they say it will be implemented later)
        - no particle trails
    - only way to add GI is to fake it

