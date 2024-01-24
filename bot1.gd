extends Node

@export var states:Dictionary = {}

signal state_changed(state,action,target)
var in_range:Array
var following:bool = false
var lock_on:Node3D
var hit:bool = false
var has_object:Node3D
var ally_open:Array
@export var targets:Dictionary = {
	"goal":null,
	"allys":[],
	"enemies":[],
	"mcguffin":null
}
var areas:Array
var team:int = 0
var search:bool = false
var catch:bool = false

## The state_template is used to guide the decisions of the bot. 
# event = the stimuli that triggers the decsion  
# action = What the bot does when the event is triggered
# strength = How much does it want to do the thing. 
#            This can be added to the action for more or less extreme actions.
# hardness = How determined the bot is to complete it's action. 
# goal = when do we determine if the task was a success or failure.

var state_template:Dictionary = {
	"event": "", 
	"action": "",
	"strength": "",
	"hardness": "", 
	"goal":""  
	}

var current_state:int = 0:
	set(new_state):
		current_state = new_state
		

# Called when the node enters the scene tree for the first time.
func _ready():
	var the_states = [["idle",null,null,null],["chase",in_range,lock_on,following],["ram",in_range,lock_on,hit]]
		#["pass",has_object,ally_open,has_object],
		#["shoot",has_object,targets["goal"],has_object],
		#["defend",targets["mcguffin"],areas[team],targets["mcguffin"]],
		#["search",lock_on,search,lock_on],
		#["catch",in_range,catch,targets["mcguffin"]]
		#]
		
	for s in the_states:
		add_state(s[0],s[1],s[2],s[3])

func _process(delta):
	compute()

func get_current_state():
	return states.keys()[current_state]

func add_state(state_name:String,event,action,goal):
	states[state_name] = state_template.duplicate()

func compute():
	var available_states = states.keys()
	match current_state:
		0: # Idle
			current_state= 1
			emit_signal("state_changed",states[get_current_state()],states[get_current_state()]["action"],"player")
		1: # chase
			current_state = 2
			emit_signal("state_changed",states[get_current_state()],states[get_current_state()]["action"],"player")
		2: # ram
			current_state = 0
			emit_signal("state_changed",states[get_current_state()],states[get_current_state()]["action"],"player")
		3: #pass
			pass
		4: #shoot
			pass
		5: #defend
			pass
		6: #search
			pass
		7: #catch
			pass
		8: #callout
			pass
	#print(get_current_state())
