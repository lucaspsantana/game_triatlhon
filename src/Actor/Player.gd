extends KinematicBody2D

var start = false
var colors = ["blue", "green", "red", "yellow"]
export var selectedColor = 0
var animationsNumberFrames = {"idle": 5, "jump": 5, "running": 6, "swimming": 4, "ride": 6}
var currentSpriteFrames: SpriteFrames
onready var animationPlayer: AnimationPlayer = $AnimationPlayer
export(String, "idle", "jump", "running", "swimming", "ride") var selectedAnimation = "idle"

func _ready():
	start_animation(selectedColor)

func _physics_process(delta):
	if start:
		$AnimatedSprite.play(str(selectedAnimation))
		if selectedAnimation == "swimming":
			animationPlayer.play("wave")
	else:
		$AnimatedSprite.play(str(selectedAnimation))
		animationPlayer.play("RESET")

func set_all_frames(index: int, colorsArray: Array, animations, spriteFrame: SpriteFrames):
	var path = str("res://assets/sprite/", colorsArray[index])
	var x = 0
	while x <  animations.get("idle"):
		spriteFrame.add_frame(
				"idle", load(str(path,"/idle",(x + 1),".png")), x
			)
		x = x + 1
	x = 0
	while x <  animations.get("ride"):
		spriteFrame.add_frame(
				"ride", load(str(path,"/ride",(x + 1),".png")), x
			)
		x = x + 1
	x = 0
	while x <  animations.get("running"):
		spriteFrame.add_frame(
				"running", load(str(path,"/running",(x + 1),".png")), x
			)
		x = x + 1
	x = 0
	while x < animations.get("swimming"):
		spriteFrame.add_frame(
				"swimming", load(str(path,"/swimming",(x + 1),".png")), x
			)
		x = x + 1
	x = 0;
	while x < animations.get("jump"):
		spriteFrame.add_frame(
				"jump", load(str(path,"/jump",(x + 1),".png")), x
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

func start_animation(number):
	currentSpriteFrames = create_frames()
	set_all_frames(number, colors, animationsNumberFrames, currentSpriteFrames)
	$AnimatedSprite.frames = currentSpriteFrames
	
