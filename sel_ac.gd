extends Node

var selected_actor = null
var erros
var avg_time
var fase = 1

var hard = false

var x : float
var y : float
var aux = 0.0
var multi = 50
var offset = Vector2(-sqrt(10000), -sqrt(10000))
var pos : Vector2

var bgPlayer

var bg = load("res://Sounds/bg.mp3")
var bg1 = load("res://Sounds/bg1.mp3")
var bg2 = load("res://Sounds/bg3.mp3")
var bg3 = load("res://Sounds/bg2.mp3")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		
	bgPlayer = get_node("/root/Menu/AudioBg")
	bgPlayer.get_parent().remove_child(bgPlayer)
	get_node("/root/SelAc").add_child(bgPlayer)
	bgPlayer.play()

func _physics_process(delta):
	aux += delta*fase*fase
	x = multi*sin(aux/2)
	y = multi*cos(aux/3)
	
	pos = Vector2(x,y) + offset
	
#	if erros == 3:
#		bgPlayer

func set_audio(arg):
	if arg == 1:
		bgPlayer.set_stream(bg1)
		bgPlayer.set_volume_db(0)
	elif arg == 2:
		bgPlayer.set_stream(bg2)
		bgPlayer.set_volume_db(0)
	elif arg == 3:
		bgPlayer.set_stream(bg3)
		bgPlayer.set_volume_db(0)
	else:
		bgPlayer.set_stream(bg)
		
		
	
	
