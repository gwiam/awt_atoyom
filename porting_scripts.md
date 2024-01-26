# Non-Issues:

    - nothing

# Issues:

    - completely incompatible, everything needs to be rewritten
    - looks like nodes are intended to only have one script
    - referencing components in Godot doesn't work because there are none
    - cannot add more than one script to a node
    - animation state changes don't work anymore (dunno where to put this)
    - instatiating objects works differently

# Solutions:

    - try to replicate the code as closely as possible
    - use _ready() to supliment Awake
        - though it's not the first thing that gets executed aparently
    - instead of referencing components you reference nodes, do not forget to cast those to the right type
    - delaying execution has to be done with a timer and signals
    - on_enable is going to be done with signals
    - instead of adding multiple scripts to one node just reuse the "Monobehavior" nodes
    - calling animations in code can be done by 
        - getting the state machine from the animation tree
        - traveling to a node
        - OR call the animation player and play an animation (don't think this is such a good idea though it would work)
    - to instantiate an object
        - (pre)load the object
        - then instantiate
        - then append it somewhere
            - when adding to root you can call_deferred to "delay" the add child until scene loads
    - finding nodes is way harder, it's easier to do "get_node("root/<path to node>")"
        - find_node is a lie
    - to cast ray you need to:
        - create RaycastQuery
        - get world state
        - call intersect_ray on world state with raycast query as parameter

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
    - raycasting seems to be more complicated too
