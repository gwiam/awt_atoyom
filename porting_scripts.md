# Non-Issues:

    - nothing

# Issues:

    - completely incompatible, everything needs to be rewritten
    - looks like nodes are intended to only have one script
    - referencing components in Godot doesn't work because there are none
    - cannot add more than one script to a node
    - animation state changes don't work anymore (dunno where to put this)
    - instatiating objects works differently
    - coroutines are not interruptable
    - no unscaled delta time
    - physics can behave radically different with different time scales
    - physics interpolation doesn't seem to exist in 4.x (yet)

# Solutions:

    - try to replicate the code as closely as possible
    - use _ready() to supliment Awake
        - though it's not the first thing that gets executed aparently
    - instead of referencing components you reference nodes, do not forget to cast those to the right type
    - delaying execution has to be done by starting a timer and connecting the timeout signal
        - can also be done in one line using "await get_tree().create_timer(<time>).timeout"
    - on_enable is going to be done with signals
    - instead of adding multiple scripts to one node just reuse the "Monobehavior" nodes
    - calling animations in code can be done by 
        - getting the state machine from the animation tree
        - traveling to a node
        - OR call the animation player and play an animation (don't think this is such a good idea though it would work)
    - to instantiate an object
        - (pre)load the object
        - then instantiate
        - set the position and rotation
        - then append it somewhere
            - when adding to root you can call_deferred to "delay" the add child until scene loads
    - finding nodes is way harder, it's easier to do "get_node("root/<path to node>")"
        - find_node is a lie
    - to cast ray you need to:
        - create RaycastQuery
        - get world state
        - call intersect_ray on world state with raycast query as paramete
        - don't forget to use global coordinates
    - referencing scripts from other nodes done by
        - giving the reference script a classname
        - referencing node by get_node(<nodepath>) as <classname>
    - to destroy a node call queue_free()
    - for detecting collision you need to 
        - set contact_monitor to true
        - set max_contacts_reported to a value greater than 0
        - connect the body_entered signal
        - can also be set in the inspector
    - references can be drag'n'dropped into a file from the scene view
        - to automatically add the @onready press and hold CTRL
    - coroutines are done with await (in Godot 4, Godot 3 uses yield)
        - await waits for a signal
        - not way to interrupt unlike in Unity
            - the first major thing that is not possible under Godot
    - workaround for unscaled time: var unscaled = (Engine.TimeScale == 0) ? deltaTime : ((float)(deltaTime / Engine.TimeScale))
        - https://github.com/godotengine/godot-proposals/issues/7775
    - scaling time works pretty much like unity
        - just set Engine.time_scale to whatever you want
    - rounding numbers can be done with snapped
    - layers can be named in the project settings, just like in Unity
        - but there is no function to get a specific layer by name unlike Unity
            - you need to iterate over all layers from the project file until you find the layer with the specific name
            - https://forum.godotengine.org/t/is-it-possible-get-collision-layer-mask-value-in-code-using-array-of-layer-names/10831/2
    - instead of setting isKinematic you freeze rigid bodies
        - there are two different kinds of freeze behaviours, see https://docs.godotengine.org/en/stable/classes/class_rigidbody2d.html#enumerations
    - when using look_at it is often needed to set use_model_front to true
        - this is due to Godots ridiculous descision to use negative Z as forward
    - game can be paused with get_tree().paused = true, see https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html


# personal nodes

    - finding members or attributes is a pain
    - so aparently $<node> is the same as get_node(<node>) but I haven't tested that yet
    - Awake() and _enter_tree() seem to do the same in both engines
    - Start() and _ready() are the same thing
    - how do I find objects in the game world when they are not inside they world yet?
    - on_enable doesn't exist in Godot? Am I supposed to poll if the bot is set to active?
        - this is where signals come in handy
    - seems like navmesh navigation in Unity is a lot easier since you don't need to write a physics process for it
    - you cannot stop navigation by stopping the physics process
    - raycasting seems to be more complicated too
        - always remember to use global position, especially when using subnodes
    - in unity the instantiation also receives some extra parameters "transform.position" and "Quaternion.LookRotation(-transform.up)"
        - presumably position and rotation
    - there is no true unscaled time
    - "Find References in Scene" is a really helpful feature in Unity
