extends KinematicBody2D

const FLOOR_NORMAL: = Vector2.UP
export var speed: = Vector2(0, 1400)
export var gravity = 3000.0
var time = 0
var power = false
var down = false
var jump_pressed = null
var time_down = 0


var jump = 0.0
var is_jump_interrupted = false
var not_in_floor = false
var parallax 

var velocity: = Vector2.ZERO

#func _ready():
	#connect("fall", self, "_fall")
	#parallax = get_parent().get_node("floor")
	#pass
	
func _physics_process(delta):
	animations()
	input()
	#is_jump_interrupted = Input.is_action_just_released("jump") and velocity.y < 0.0
	#not_in_floor = Input.is_action_just_pressed("down") and !$Player.is_on_floor()
	velocity = calculate_move_velocity(velocity, speed, is_jump_interrupted, not_in_floor)
	velocity = $Player.move_and_slide(velocity, FLOOR_NORMAL)
	

func animations():
	$Player/CollisionShape2D2.position.y = 0
	$Player/CollisionShape2D2.scale.y = 1
	if velocity.y < 0:
		$Player/AnimatedSprite.play("jump")
	elif velocity.y == 0:
		$Player/AnimatedSprite.play("run")

func calculate_move_velocity(
		linear_velocity: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool,
		not_in_floor: bool
	) -> Vector2: 

	var out: = linear_velocity
	out.y += gravity * get_physics_process_delta_time()
	
	if jump == -1.0: 
		out.y = speed.y * (-1.0)
		jump_pressed = null
	
	if is_jump_interrupted:
		out.y = 0.0
		jump = 0
		jump_pressed = null
	
	if not_in_floor:
		out.y = speed.y
		
	return out

func input():
	if (Input.is_action_just_pressed("jump") or jump_pressed) and $Player.is_on_floor():
		jump = -1.0
		down = false
	else:
		jump = 0
	
	if (Input.is_action_just_released("jump") or jump_pressed == false) and velocity.y < 0.0:
		is_jump_interrupted = true
	else:
		is_jump_interrupted = false
	
func countdown():
	yield(get_tree(), "idle_frame") # returns a GDScriptFunctionState object to _ready()
	yield(get_tree().create_timer(0.8), "timeout")

func _on_jump_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and $Player.is_on_floor():
		jump = -1.0
	else:
		jump = 0


func _on_jump_pressed():
	jump_pressed = true
	if $Player.is_on_floor():
		jump = -1.0
	else:
		jump = 0


func _on_jump_button_up():
	jump_pressed = false
	if velocity.y < 0.0:
		is_jump_interrupted = true
	else:
		is_jump_interrupted = false
	
func play_jump_sound():
	if $"/root/SoundConfig".enable_sound:
		$jumpSound.play()
