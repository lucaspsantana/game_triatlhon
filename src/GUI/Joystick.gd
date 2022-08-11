extends CanvasLayer

var swimIncrement = 10
var swimDecrement = swimIncrement 
var pedalIncrement = 45
var pedalDecrement = pedalIncrement 
var buttons = ['left', 'right']

var availableTouch = false
var touchGoals = 10
var touchCount = 0

func _ready():
	if(OS.get_name() != "Windows"):
		swimIncrement = swimIncrement * 3
		pedalIncrement = pedalIncrement * 3
	availableTouch = true
	$AvailableTimer.start()
	$"/root/Settings".swim = 0
	$"/root/Settings".pedal = 0

func _physics_process(delta):
	getEventInput()
#	
func getEventInput():
	if Input.get_action_strength("left"):
		isAvailableTouch()
	if Input.get_action_strength("right"):
		isAvailableTouch()

func increment():
	#print("Incrementou")
	$"/root/Settings".swim += swimIncrement
	$"/root/Settings".pedal += pedalIncrement
	#print("increment ", swimIncrement)

func decrement():
	#print("Decrementou")
	$"/root/Settings".swim = -swimDecrement
	$"/root/Settings".pedal = -pedalDecrement

func _on_left_pressed():
	isAvailableTouch()

func _on_right_pressed():
	isAvailableTouch()

func isAvailableTouch():
	if availableTouch:
		touchCount += 1
		
func _on_AvailableTimer_timeout():
	if availableTouch:
		$AvailableTimer.wait_time = 0.5
		$AvailableTimer.start()
		if touchCount >= touchGoals:
			increment()
		else:
			decrement()
	else:
		$AvailableTimer.wait_time = 2
		$AvailableTimer.start()
	touchCount = 0
	availableTouch = !availableTouch
		
