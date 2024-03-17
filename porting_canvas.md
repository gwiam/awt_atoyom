# Non-issues:

- prefabs themselves are imported
- only hierarchy survived
- a lot of element can be translated tho
- font was imported, just needs to be reapplied

# Issues:
    
- canvas layer not translated
- canvas elements not translated

# Solutions:

- change main node type to "CanvasLayer"
- scale has to be manually set to 1 1
- for text use Label, no need for TextMeshPro
- for images use "TextureRect2D"
- for panel use "ColorRect2D"
- alignment is all handled similarly to Unity
    - though texture placement is controlled by "strech_mode" and "expand_mode"
        - inconsistent, you may need to reposition the anchor or the entire element for it to take effect 
        - size cannot be adjusted unless strech_mode is set to "ignore size" (maybe move this section to porting_UI or something)
        - pivot offset needs to be manually put in the middle of the node
- instead of setting the visibility canvases have hide() and show() methods
- Theming:
    - central theming system for the entire UI
    - done partially in a seperate editor, and partially in the inspector
        - you add settings options in the theme editor and then change them in the inspector
    - you can also just use theme overrides
- Buttons don't call functions, instead one must use signals to detect button presses
    - creating an extra script file for all button events
    - reference functions inside that scripts instead

# Personal notes:

- canvas layers are edited in 2D mode
- you can use regular 2D but there are dedicated green "Control" elements for canvases
- canvas seems to have no "canvas render" equivalent, don't think it's needed
- most canvas tutorials suck
- centering really small stuff is a pain
- the theme editor is hot garbage
    - when you close the theme editor once it doesn't open up again
    - restoring the editor layout to default doesn't reset this behavior
    - there are no docs for it