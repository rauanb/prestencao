extends Control

var AudioGO = load("res://Sounds/ResultsGameOver.wav")
var AudioDx = load("res://Sounds/ResultsDixie.wav")
var AudioMr = load("res://Sounds/ResultsMario.wav")
var AudioSo = load("res://Sounds/ResultsSonic.wav")
var AudioYo = load("res://Sounds/ResultsYoshi.wav")

var tx1 = load("res://UI/jogar1.png")
var tx2 = load("res://UI/jogar2.png")
var tx3 = load("res://UI/jogar3.png")

func _ready():
	$VBoxContainer2/CenterContainer/PlayButton.set_visible(false)
	$VBoxContainer2/CenterContainer3/QuitButton.set_visible(false)
	
	if SelAc.fase == 3:
		$VBoxContainer/CenterContainer3/FinishedLabel.text = "PARABÉNS !"
		$VBoxContainer2/CenterContainer/PlayButton.set_normal_texture(tx1)
		$VBoxContainer2/CenterContainer/PlayButton.set_hover_texture(tx2)
		$VBoxContainer2/CenterContainer/PlayButton.set_focused_texture(tx2)
		$VBoxContainer2/CenterContainer/PlayButton.set_pressed_texture(tx3)
	else:
		$VBoxContainer/CenterContainer3/FinishedLabel.text = ""
		
	if SelAc.erros > 0:
		$VBoxContainer/CenterContainer/ErrorLabel.text = "Erros: " + str(SelAc.erros)
	else:
		$VBoxContainer/CenterContainer/ErrorLabel.text = ""
	sound(SelAc.erros,SelAc.selected_actor)
	
	if SelAc.avg_time > 0:
		$VBoxContainer/CenterContainer2/TimeLabel.text = "Tempo de Resposta: " + str(SelAc.avg_time) + " ms"
	else:
		$VBoxContainer/CenterContainer2/TimeLabel.text = ""
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
	if SelAc.erros == 3:
		SelAc.set_audio(0)
		get_tree().change_scene("res://Selection.tscn")
	elif SelAc.fase == 1:
		get_tree().change_scene("res://Main2.tscn")
	elif SelAc.fase == 2:
		get_tree().change_scene("res://Main3.tscn")
	else:
		SelAc.set_audio(0)
		get_tree().change_scene("res://Selection.tscn")


func _on_QuitButton_pressed():
	$AudioSelection.play()
	yield($AudioSelection,"finished")
	get_tree().quit()


func _on_PlayButton_focus_exited():
	$AudioChange.play()

func _on_QuitButton_focus_exited():
	$AudioChange.play()
	
func sound(erros,selecionado):
	if erros == 3:
		$AudioResults.set_stream(AudioGO)
	elif selecionado == 0:
		$AudioResults.set_stream(AudioDx)
	elif selecionado == 1:
		$AudioResults.set_stream(AudioMr)
	elif selecionado == 2:
		$AudioResults.set_stream(AudioSo)
	else:
		$AudioResults.set_stream(AudioYo)
		
	SelAc.bgPlayer.stop()
	$AudioResults.play()
	
