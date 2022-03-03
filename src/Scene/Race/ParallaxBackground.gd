extends ParallaxBackground

var parallax_offset = 0
var speed = 600
var speed_limit = speed
var play = false

func _process(delta):
	if play:
		if $"/root/Settings".dano:
			speed = speed - 50
			$"/root/Settings".dano = 0
		if speed <= 0:
			speed = 0
		if $"/root/Settings".dash:
			speed = speed_limit
			$"/root/Settings".dash = 0
		#print("Dano "+str($"/root/Settings".dano))
		parallax_offset -= delta * speed
		set_scroll_offset(Vector2(parallax_offset, 0))
