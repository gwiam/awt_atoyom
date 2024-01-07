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
    - instead of referencing components you reference nodes, do not forget to cast those to the right type

# personal nodes

    - finding members or attributes is a pain
    - delaying execution has to be done with a timer and signals 
        - maybe later...
    - so aparently $<node> is the same as get_node(<node>) but I haven't tested that yet
    - Awake() and _ready() seem to do the same in both engines
