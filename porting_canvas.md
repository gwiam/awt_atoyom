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
- for any organzational elements "BoxContainer" 
    - the original code used all sorts of things and is not consistent
- alignment is all handled similarly to Unity
    - though texture placement is controlled by "strech_mode" and "expand_mode"
        - inconsistent, you may need to reposition the anchor or the entire element for it to take effect 
        - size cannot be adjusted unless strech_mode is set to "ignore size" (maybe move this section to porting_UI or something)
        - pivot offset needs to be manually put in the middle of the node
- when using a box container to organize a row or column of elements
    - you cannot set the dimensions of the container
    - instead set the dimensioons of the elements by changing the "custom minimum size", but pixel values don't translate 1 to 1 from unity
- instead of setting the visibility canvases have hide() and show() methods
- Theming:
    - central theming system for the entire UI
    - done partially in a seperate editor, and partially in the inspector
        - you add settings options in the theme editor and then change them in the inspector
        - to use original font on Buttons
            - chose Button type
            - change to "T" and add font
            - then set it to MajorMonoDisplay-Regular.ttf
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
- they say the canvas has no height but it's always "648 pixels" high
    - don't use the pixel measurements