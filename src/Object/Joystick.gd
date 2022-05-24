extends CanvasLayer

var swimIncrement = 5
var swimDecrement = swimIncrement * 0.1
var pedalIncrement = 35
var pedalDecrement = pedalIncrement * 0.3
var timeToActive = 0
var buttons = ['left', 'right']
var rng = RandomNumberGenerator.new()
var randomIndex
var defaultColor = 'fff'
var colorActive = 'efe664'
var hitColor = '00a000'
var faultColor = 'd85b55'

func _ready():
	rng.randomize()
	randomIndex = rng.randi_range(0,1)
	if(OS.get_name() != "Windows"):
		swimIncrement = swimIncrement * 3
		pedalIncrement = pedalIncrement * 3

func _physics_process(delta):
	timeToActive += 1
	getEventInput()
	if timeToActive == 10:
		get_node(str(buttons[randomIndex])).set_modulate(str(colorActive))
	if timeToActive == 40:
		get_node(str(buttons[randomIndex])).set_modulate(str(defaultColor))
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
	#print("Incrementou")
	$"/root/Settings".swim += swimIncrement
	$"/root/Settings".pedal += pedalIncrement

func decrement():
	print("Decrementou")
	$"/root/Settings".swim -= swimDecrement
	$"/root/Settings".pedal -= pedalDecrement

func _on_left_pressed():
	isLeftActive()

func _on_right_pressed():
	isRightActive()

func isLeftActive():
	if $left.modulate.to_html(false) == colorActive:
		increment()
		#$left.set_modulate(str(hitColor))
		#$left.set_modulate(str(colorActive))
	else:
		decrement()
		#$left.set_modulate(str(faultColor))
		#$left.set_modulate(str(defaultColor))

func isRightActive():
	if $right.modulate.to_html(false) == colorActive:
		increment()
		#$right.set_modulate(str(hitColor))
		#$right.set_modulate(str(colorActive))
	else:
		decrement()
		#$right.set_modulate(str(faultColor))
		#$right.set_modulate(str(defaultColor))
