# Non-issues:

- prefabs themselves are imported
- only hierarchy survived

# Issues:
    
- canvas layer not translated
- canvas elements not translated

# Solutions:

- change main node type to "CanvasLayer"
- scale has to be manually set to 1 1
- for text use Label, no need for TextMeshPro
- for images use "TextureRect2D"
- alignment is all handled similarly to Unity
    - though texture placement is controlled by "strech_mode" and "expand_mode"
        - inconsistent, you may need to reposition the anchor or the entire element for it to take effect 
        - size cannot be adjusted unless strech_mode is set to "ignore size" (maybe move this section to porting_UI or something)
        - pivot offset needs to be manually put in the middle of the node
- instead of setting the visibility canvases have hide() and show() methods

# Personal notes:

- canvas layers are edited in 2D mode
- you can use regular 2D but there are dedicated green "Control" elements for canvases
- canvas seems to have no "canvas render" equivalent, don't think it's needed
    - most canvas tutorials suck
    - centering really small stuff is a pain
- TODO somehow get the game font from Unity into Godot