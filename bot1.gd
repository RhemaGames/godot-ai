extends Node

var states:Dictionary = {}

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
		print_debug(get_current_state(current_state)) 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass

func _physics_process(delta):
	pass


func get_current_state(state):
	return states.keys()[state]

func add_state(state_name:String):
	states[state_name] = state_template.duplicate()
