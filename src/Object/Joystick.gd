extends CanvasLayer

var swimIncrement = 15
var pedalIncrement = 35
var timeToActive = 0
var buttons = ['left', 'right']
var rng = RandomNumberGenerator.new()
var randomIndex
var auxRandomIndex
var colorActive = 'efe664'

func _ready():
	rng.randomize()
	randomIndex = rng.randi_range(0,1)
	auxRandomIndex = randomIndex

func _physics_process(delta):
	timeToActive += 1
	if timeToActive == 60:
		get_node(str(buttons[randomIndex])).set_modulate(str(colorActive))
		getEventInput()
	if timeToActive == 70:
		get_node(str(buttons[randomIndex])).set_modulate('fff')
		timeToActive = 0
		if randomIndex:
			randomIndex = 0
		else:
			randomIndex = 1

func getEventInput():
	if Input.get_action_strength("left"):
		isLeftActive()
	if Input.get_action_strength("right"):
		isRightActive()
	

func increment():
	print("Incrementou")
	$"/root/Settings".swim += swimIncrement
	$"/root/Settings".pedal += pedalIncrement

func decrement():
	print("Decrementou")
	$"/root/Settings".swim -= swimIncrement
	$"/root/Settings".pedal -= pedalIncrement
	
func _on_left_pressed():
	isLeftActive()

func _on_right_pressed():
	isRightActive()
		
func isLeftActive():
	if $left.modulate.to_html(false) == colorActive:
		increment()
	else:
		decrement()
		
func isRightActive():
	if $right.modulate.to_html(false) == colorActive:
		increment()
	else:
		decrement()
