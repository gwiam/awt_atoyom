# Non-Issues:

    - nothing

# Issues:

    - completely incompatible, everything needs to be rewritten
    - looks like nodes are intended to only have one script
    - referencing components in Godot doesn't work because there are none
    - cannot add more than one script to a node

# Solutions:

    - try to replicate the code as closely as possible
    - use _ready() to supliment Awake
        - though it's not the first thing that gets executed aparently
    - instead of referencing components you reference nodes, do not forget to cast those to the right type
    - delaying execution has to be done with a timer and signals
    - on_enable is going to be done with signals

# personal nodes

    - finding members or attributes is a pain
    - so aparently $<node> is the same as get_node(<node>) but I haven't tested that yet
    - Awake() and _ready() seem to do the same in both engines
    - references can be drag'n'dropped into a file from the scene view
        - Godot doesn't add an @onready by itself anymore
    - how do I find objects in the game world when they are not inside they world yet?
    - on_enable doesn't exist in Godot? Am I supposed to poll if the bot is set to active?
        - this is where signals come in handy
    - seems like navmesh navigation in Unity is a lot easier since you don't need to write a physics process for it
    - you cannot stop navigation by stopping the physics process
