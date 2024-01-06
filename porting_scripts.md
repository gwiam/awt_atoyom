# Non-Issues:

    - nothing

# Issues:

    - completely incompatible, everything needs to be rewritten
    - looks like nodes are intended to only have one script
    - referencing components in Godot doesn't work because there are none

# Solutions:

    - try to replicate the code as closely as possible
    - Awake() and _ready() seem to do the same in both engines
    - instead of referencing components you reference nodes, do not forget to cast those to the right type

# personal nodes

    - finding members or attributes is a pain
    - delaying execution is still not clear
    - so aparently $<node> is the same as get_node(<node>) but I haven't tested that yet
