extends Control

var count = 0

func _ready():
	$MarginContainer/VBoxContainer/HBoxContainer/Actor1.grab_focus()
	SelAc.erros = 0
	SelAc.fase = 1
	SelAc.hard = false
	SelAc.avg_time = 0.0
	
	if not SelAc.bgPlayer.is_playing():
		SelAc.bgPlayer.play()


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("ui_down"):
		count += 1
		
		if count == 10:
			modo_hard()
			
func modo_hard():
	$AudioHard.play()
	yield($AudioHard,"finished")
	$AudioHard.stop()
	SelAc.hard = true
	

func _on_Actor1_pressed():
	$AudioSelection.play()
	yield($AudioSelection,"finished")
	SelAc.selected_actor = 0
	get_tree().change_scene("res://Main.tscn")

func _on_Actor2_pressed():
	$AudioSelection.play()
	yield($AudioSelection,"finished")
	SelAc.selected_actor = 1
	get_tree().change_scene("res://Main.tscn")


func _on_Actor3_pressed():
	$AudioSelection.play()
	yield($AudioSelection,"finished")
	SelAc.selected_actor = 2
	get_tree().change_scene("res://Main.tscn")


func _on_Actor4_pressed():
	$AudioSelection.play()
	yield($AudioSelection,"finished")
	SelAc.selected_actor = 3
	get_tree().change_scene("res://Main.tscn")


func _on_Actor1_focus_exited():
	$AudioChange.play()

func _on_Actor2_focus_exited():
	$AudioChange.play()

func _on_Actor3_focus_exited():
	$AudioChange.play()

func _on_Actor4_focus_exited():
	$AudioChange.play()
