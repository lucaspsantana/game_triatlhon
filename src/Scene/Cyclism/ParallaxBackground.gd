extends ParallaxBackground

var parallax_offset = 0
var time = 0.0
var speed = 700
var speed_limit = speed
var play = false
var decrement = false

func _ready():
	speed = 0

func _process(delta):
	if play:
		if decrement:
			speed = speed - 30
			decrement = false 
			print(speed)
		else:
			speed = speed + $"/root/Settings".swim
		$"/root/Settings".swim = 0		
		if speed > speed_limit:
			speed = speed_limit
		if speed < 0:
			speed = 0
		parallax_offset -= speed * delta
		set_scroll_offset(Vector2(parallax_offset, 0))

func _on_Timer_timeout():
	decrement = true
