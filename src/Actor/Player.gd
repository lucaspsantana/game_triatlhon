extends KinematicBody2D

var start = false
var colors = ["blue", "green", "red", "yellow"]
export var selectedColor = 0
var animationsNumberFrames = {"idle": 5, "jump": 5, "running": 6, "swimming": 4, "ride": 6}
var currentSpriteFrames: SpriteFrames
onready var animationPlayer: AnimationPlayer = $AnimationPlayer

func _ready():
	start(selectedColor)

func _physics_process(delta):
	if start:
		$AnimatedSprite.play('swimming')
		animationPlayer.play("wave")
	else:
		$AnimatedSprite.play("idle")
		animationPlayer.play("RESET")

func set_all_frames(index: int, colors: Array, animations, spriteFrame: SpriteFrames):
	var path = str("res://assets/sprite/", colors[index])
	var x = 0
	while x <  animations.get("idle"):
		spriteFrame.add_frame(
				"idle", load(str(path,"/idle_",(x + 1),".png")), x
			)
		x = x + 1
	x = 0
	while x <  animations.get("ride"):
		spriteFrame.add_frame(
				"ride", load(str(path,"/ride_",(x + 1),".png")), x
			)
		x = x + 1
	x = 0
	while x <  animations.get("running"):
		spriteFrame.add_frame(
				"running", load(str(path,"/running_",(x + 1),".png")), x
			)
		x = x + 1
	x = 0
	while x < animations.get("swimming"):
		spriteFrame.add_frame(
				"swimming", load(str(path,"/swimming_",(x + 1),".png")), x
			)
		x = x + 1
	x = 0;
	while x < animations.get("jump"):
		spriteFrame.add_frame(
				"jump", load(str(path,"/jump_",(x + 1),".png")), x
			)
		x = x + 1
	x = 0

func create_frames():
	var frame: SpriteFrames = SpriteFrames.new()
	frame.add_animation("idle")
	frame.add_animation("jump")
	frame.add_animation("running")
	frame.add_animation("swimming")
	frame.add_animation("ride")
	
	return frame

func start(number):
	currentSpriteFrames = create_frames()
	set_all_frames(selectedColor, colors, animationsNumberFrames, currentSpriteFrames)
	$AnimatedSprite.frames = currentSpriteFrames

	
