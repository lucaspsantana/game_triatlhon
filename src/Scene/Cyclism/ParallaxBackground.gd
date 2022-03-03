extends ParallaxBackground

var parallax_offset = 0
var time = 0.0
var speed = 700
var speed_limit = speed
var play = false

func _ready():
	speed = 600
	$"/root/Settings".pedal = 0

func _process(delta):
	if play:
		if speed <= speed_limit:
			if $"/root/Settings".pedal >= 20:
				#print($"/root/Settings".pedal)
				speed = speed + $"/root/Settings".pedal * delta
				$"/root/Settings".pedal -= 20
		if speed > 0:
			#time += 10 * delta 
			speed = speed - 20 * delta
			if speed <= 0:
				speed = 0
		if speed >= speed_limit:
			$"/root/Settings".pedal = 0
		#print(speed)
		parallax_offset -= delta * speed
		set_scroll_offset(Vector2(parallax_offset, 0))
