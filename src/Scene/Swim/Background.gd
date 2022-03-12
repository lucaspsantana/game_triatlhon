extends ParallaxBackground

var parallax_offset = 0
var time = 0.0
var speed = 150
var speed_limit = speed
var play = false

func _ready():
	speed = 0

func _process(delta):
	if play:
		speed = speed + $"/root/Settings".swim * delta
#		if speed > 0: #sempre decrementar a velocidade
#			#time += 10 * delta 
#			speed = speed - $"/root/Settings".swimMax * delta
		if speed > speed_limit:
			speed = speed_limit
		if speed < 0:
				speed = 0
		#print(speed)
		parallax_offset -= delta * speed
		set_scroll_offset(Vector2(parallax_offset, 0))

func _on_Timer_timeout():
	speed = speed - $"/root/Settings".swimMax * get_process_delta_time()
	$"/root/Settings".swim = 0

