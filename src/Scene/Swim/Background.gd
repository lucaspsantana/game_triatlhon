extends ParallaxBackground

var parallax_offset = 0
var time = 0.0
var speed = 150
var speed_limit = speed
var play = false

var obstacules

var dash_timer = 0

func _ready():
	speed = 100
	pass

func _process(delta):
	if play:
		if speed <= speed_limit:
			if $"/root/Settings".swim >= 10:
				#print($"/root/Settings".swim)
				speed = speed + $"/root/Settings".swim * delta
				$"/root/Settings".swim -= 10
		if speed > 0:
			#time += 10 * delta 
			speed = speed - 10 * delta
			if speed <= 0:
				speed = 0
		if speed >= speed_limit:
			$"/root/Settings".swim = 0
		
		#print(speed)
		parallax_offset -= delta * speed
		set_scroll_offset(Vector2(parallax_offset, 0))


