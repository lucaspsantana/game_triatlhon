extends CanvasLayer

var distance = 0.0
var velocity = 0.0
var time = 0.0

func _physics_process(delta):
	$distance.text = "Distância: %3.0f km" %distance
	$time.text = "%2.1f s" %time
	$velocity.text = "Velocidade: %3.0f km/h" %velocity

func setValueScore(distanceParam: float, velocityParam: int, timeParam: float):
	distance = distanceParam
	time = timeParam
	velocity = velocityParam
