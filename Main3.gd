extends Node2D

var sprite_size = [200, 240]
var screen_size = [1366, 768]

var delay = [0.2, 0.8]
var exposure = 0.8

var actors_list = []

var time = 0.0
var time_list = []

var sorted_actor
var errors = 0

var ultimo = false

func _ready():
	if SelAc.hard:
		exposure = 0.39
		delay = [0.1, 0.2]
	
	SelAc.set_audio(3)
	SelAc.bgPlayer.play()
	SelAc.fase = 3
	randomize()
	actors_list = [1, 2, 3, 4]
	$Actor.set_visible(false)
	new_test()
#	print(sprite_size[1]/2)
#	print(screen_size[1] - sprite_size[1]/2)


func _process(delta):
#	print(errors)
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_just_pressed("ui_accept") and $Actor.is_visible():
		check()
		
	if errors >= 3:
		end_game()
		
	if $Actor.visible:
		time += delta
		
	
	if time >= exposure:
		check_miss()
		new_test()
		
		
func new_test():
	$Actor.set_visible(false)
	sort_actor()
	define_pos()
	time = 0.0

	
func sort_actor():
	sorted_actor = randi() % actors_list.size()
	var path = "res://Actors/" + str(actors_list[sorted_actor]) + ".png"
	$Actor.texture = load(path)
	$Actor.set_flip_h(randi() % 2)
	
func define_pos():
	var pos_x = rand_range(sprite_size[0]/2, screen_size[0] - sprite_size[0]/2)
#	var pos_y = rand_range(sprite_size[1]/2, screen_size[1] - sprite_size[1]/2)
	var pos_y = rand_range(sprite_size[1]/1.5, screen_size[1] - sprite_size[1]/1.2)
	yield(get_tree().create_timer(rand_range(delay[0], delay[1])), "timeout")
	
	$Actor.set_position(Vector2(pos_x,pos_y))
	if errors < 3:
		$Actor.set_visible(true)
	

func check():
	if ultimo:
		end_game()
	elif sorted_actor == SelAc.selected_actor:
		time_list.append(time)
		$AudioScore.play()
	else:
		errors += 1
		$AudioError.play()
	new_test()

func check_miss():
	if ultimo:
		end_game()
	elif sorted_actor == SelAc.selected_actor:
		errors += 1
		$AudioError.play()


func _on_EndTimer_timeout():
	ultimo = true
#	print("ultimo")

func end_game():
	SelAc.erros = errors
	
	if time_list.size() > 0:
		var total = 0.0
		
		for i in time_list:
			total += i
			
		SelAc.avg_time = stepify(total / time_list.size(), 0.001)
		SelAc.avg_time *= 1000
	if $AudioError.is_playing():
		yield($AudioError,"finished")
	get_tree().change_scene("res://Results.tscn")
	
	
	
	
	
	
	
