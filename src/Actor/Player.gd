extends KinematicBody2D
var start = false

func _ready():
	pass

func _physics_process(delta):
	if start:
		$AnimatedSprite.play('swim')
	
