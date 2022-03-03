extends ParallaxBackground

var in_hole = false
var paralax
var speed = 600

var parallax_offset = 0
var rng = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()
var rng3 = RandomNumberGenerator.new()
var rng4 = RandomNumberGenerator.new()
var water = preload("res://src/Object/Water.tscn")

func _ready():
	rng.randomize()
	rng2.randomize()
	rng3.randomize()
	rng4.randomize()
	
	#Criando lixo em um dos lugares aleatorios
	var rock_random = rng3.randi_range(0,2)
	var noderock = preload("res://src/Object/Rock.tscn")
	var scenerock = noderock.instance()
	var posrock = get_tree().get_nodes_in_group("obstacules")
	scenerock.global_position = posrock[rock_random].position
	$ParallaxLayer.add_child(scenerock)
	#print("rock "+str(rock_random))
	#print(posrock[rock_random].name)
	
	#Criando mosquitos em um dos lugares aleatorios	
	var radom_mosquito = rng3.randi_range(0,2)
	var nodeMosquito = preload("res://src/Object/Mosquito.tscn")
	var sceneMosquito = nodeMosquito.instance()
	var posMosquito = get_tree().get_nodes_in_group("mosquito")
	sceneMosquito.global_position = posMosquito[radom_mosquito].position
	$ParallaxLayer.add_child(sceneMosquito)
	#print("mosquito "+str(radom_mosquito))
	#print(posMosquito[radom_mosquito].name)

	var pos = get_tree().get_nodes_in_group("water");
	#Criando frutas em um dos lugares aleatorios		
	var random_number = rng.randi_range(0, 2)
	var node = water
	var scene = node.instance()
	scene.global_position = pos[random_number].position
	$ParallaxLayer.add_child(scene)

func _process(delta):
	speed = $"/root/Settings".parallax_speed_obstacule
	parallax_offset -= delta * speed
	set_scroll_offset(Vector2(parallax_offset, 0))

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Obstacules_tree_exiting():
	queue_free()
