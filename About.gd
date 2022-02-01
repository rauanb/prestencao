extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer2/CenterContainer/PlayButton.set_visible(false)
	$VBoxContainer2/CenterContainer3/QuitButton.set_visible(false)
	
	yield(get_tree().create_timer(2.0),"timeout")
	$VBoxContainer2/CenterContainer/PlayButton.set_visible(true)
	$VBoxContainer2/CenterContainer3/QuitButton.set_visible(true)
	$VBoxContainer2/CenterContainer/PlayButton.grab_focus()
		
		
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()


func _on_PlayButton_pressed():
	$AudioSelection.play()
	yield($AudioSelection,"finished")
	get_tree().change_scene("res://Selection.tscn")


func _on_QuitButton_pressed():
	$AudioSelection.play()
	yield($AudioSelection,"finished")
	get_tree().quit()


func _on_PlayButton_focus_exited():
	$AudioChange.play()

func _on_QuitButton_focus_exited():
	$AudioChange.play()
	
