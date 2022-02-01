extends Control

var aux = 0.0

func _ready():
	$VBoxContainer/CenterContainer/PlayButton.grab_focus()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	aux += delta/2
	var pulse = Color(abs(sin(2*aux))+0.3,0.1,0.1)
	print(pulse)
	$CenterContainer/Label.set_self_modulate(pulse)

func _on_PlayButton_pressed():
	$AudioSelection.play()
	yield($AudioSelection,"finished")
	get_tree().change_scene("res://Selection.tscn")

func _on_AboutButton_pressed():
	$AudioSelection.play()
	yield($AudioSelection,"finished")
	get_tree().change_scene("res://About.tscn")

func _on_QuitButton_pressed():
	$AudioSelection.play()
	yield($AudioSelection,"finished")
	get_tree().quit()

func _on_PlayButton_focus_exited():
	$AudioChange.play()

func _on_AboutButton_focus_exited():
	$AudioChange.play()

func _on_QuitButton_focus_exited():
	$AudioChange.play()
	
